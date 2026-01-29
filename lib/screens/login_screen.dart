import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/call_controller.dart';

class LoginPage extends GetView<CallController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zego Cloud Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller.userIDTextCtrl,
              decoration: const InputDecoration(labelText: "My ID"),
            ),
            TextField(
              controller: controller.userNameTextCtrl,
              decoration: const InputDecoration(labelText: "My Name"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: controller.onLogin,
              child: const Text("Login & Enable Calling"),
            ),
          ],
        ),
      ),
    );
  }
}