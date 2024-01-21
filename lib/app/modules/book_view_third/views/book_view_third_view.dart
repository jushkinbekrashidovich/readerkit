import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:readerkit/app/const/theme/app_colors.dart';

import '../controllers/book_view_third_controller.dart';

class BookViewThirdView extends GetView<BookViewThirdController> {
  const BookViewThirdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: AppColors.themeCream,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            toolbarHeight: 39,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  print(controller.epubController!.generateEpubCfi().toString());
                },
                icon: Icon(Icons.add),
              ),
            ],
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.back,
                color: AppColors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: AppColors.themeCream,
          ),
          body: EpubView(
            controller: controller.epubController!,
            onExternalLinkPressed: (href) {},
            builders: EpubViewBuilders<DefaultBuilderOptions>(
              options: const DefaultBuilderOptions(),
              chapterDividerBuilder: (_) => const Divider(),
            ),
          ),
          endDrawer: Drawer(
            child: EpubViewTableOfContents(
              controller: controller.epubController!,
              itemBuilder: (context, index, chapter, itemCount) {
                return ListTile(
                  title: Text(chapter.title.toString()),
                  onTap: () {
                    print(controller.epubController!.generateEpubCfi());
                  },
                );
              },
            ),
          ),
        );
  }
}
