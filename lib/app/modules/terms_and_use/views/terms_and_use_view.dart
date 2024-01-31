import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/terms_and_use_controller.dart';

class TermsAndUseView extends GetView<TermsAndUseController> {
  const TermsAndUseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermsAndUseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TermsAndUseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
