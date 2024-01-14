import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class BookViewSecondController extends GetxController {
  late String pdfPath;
  late RxString extractedText = ''.obs;
  late PdfDocument document;
  late RxBool isLoading = true.obs;
  RxInt currentPage = 0.obs;
  RxBool isBionicMode = false.obs; 

  final List<Color> colorList = [
  Colors.white,
  Color(0xFFF5F5F5), // Off-White
  Color(0xFFFFF8DC), // Cream/Ivory
  Color(0xFFD3D3D3), // Light Gray
  Color(0xFFF5F5DC), // Beige/Light Tan
]; 

final List<String> fontStyles = ["Roboto", "Instrument Serif", "Lato", "Open Sans"];
   

// String getHtmlContent(String text) {
//   return '''
//     <!DOCTYPE html>
//     <html lang="en">
//     <head>
//       <meta charset="UTF-8">
//       <meta http-equiv="X-UA-Compatible" content="IE=edge">
//       <meta name="viewport" content="width=device-width, initial-scale=1.0">
//       <title>Bionic Reading</title>
//       <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,500,300italic,500italic,700italic,900,300">
//       <style>
//         html, body {
//           height: 100%;
//           padding: 0;
//           margin: 0;
//           font-family: "Roboto", sans-serif;
//         }

//         @media only screen and (max-width: 600px) {
//           .content {
//             width: 95% !important;
//             height: 95% !important;
//             padding: 0px 4px 0px 4px !important;
//           }
//         }

//         .read {
//           font-size: 1.2em;
//           font-weight: 300;
//           word-break: break-word;
//         }

//         .read b {
//           font-weight: 500;
//         }
//       </style>
//     </head>
//     <body>
//       <div class="content">
//         <div class="read" id="read">
//           $text
//         </div>
//       </div>
//       <script>
//         const r = document.getElementById("read");

//         const updateContent = () => {
//           const words = r.innerText.split(" ");
//           r.innerHTML = words.map(w => `<b>${w.substring(0, math.max(1, w.length / 2))}</b>${w.substring(math.max(1, w.length / 2))} `).join(" ");
//         };

//         updateContent();
//       </script>
//     </body>
//     </html>
//   ''';
// }








  @override
  void onInit() {
    print("onInit called");
    initializePdfDocument();
    
    
    super.onInit();
  }
  Future<void> initializePdfDocument() async {
  pdfPath = Get.arguments;
  try {
    document = PdfDocument(inputBytes: File(pdfPath).readAsBytesSync());

    String text = PdfTextExtractor(document).extractText();

    extractedText.value = text;
    update();
  } catch (e) {
    print("Error initializing PDF document: $e");
  } finally {
    isLoading.value = false; // Set loading state to false regardless of success or failure
    
  }
}



  @override
  void dispose() {
    document.dispose();
    super.dispose();
  }
}
