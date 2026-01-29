import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit/zego_uikit.dart';

import '../controller/call_controller.dart';

class HomePage extends GetView<CallController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("My ID: ${controller.myID.value}")),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: controller.onLogout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter Target User ID:"),
            TextField(
              controller: controller.targetUserIDTextCtrl,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),

            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller.targetUserIDTextCtrl,
              builder: (context, value, _) {
                final targetID = value.text.trim();
                return Center(
                  child: ZegoSendCallInvitationButton(
                    isVideoCall: false,
                    invitees: [
                      ZegoUIKitUser(id: targetID, name: "User $targetID"),
                    ],
                    resourceID: "zego_uikit_call",
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
