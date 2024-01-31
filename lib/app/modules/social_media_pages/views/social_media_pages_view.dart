import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/social_media_pages_controller.dart';

class SocialMediaPagesView extends GetView<SocialMediaPagesController> {
  const SocialMediaPagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SocialMediaPagesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SocialMediaPagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
