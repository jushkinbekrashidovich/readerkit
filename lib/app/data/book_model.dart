class Book {
  final String title;
  final String path;
  final int pageNumber;
  final String format;
  final int pdfSize; 
  bool isFinished;

  Book({
    required this.title,
    required this.path,
    required this.pageNumber,
    required this.format,
    required this.pdfSize, 
    required this.isFinished,
  });

  // Method to convert Book object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'path': path,
      'pageNumber': pageNumber,
      'format': format,
      'pdfSize': pdfSize, // Include pdfSize i
      'isFinished':isFinished,
    };
  }

  // Factory method to create a Book object from JSON
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      path: json['path'],
      pageNumber: json['pageNumber'],
      format: json['format'],
      pdfSize: json['pdfSize'], // Initialize pdfSize
      isFinished: json['isFinished'],
    );
  }
}
