import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_zego_cloud_demo/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallController extends GetxController {
  RxString myID = "".obs;
  RxString myName = "".obs;

  final userIDTextCtrl = TextEditingController(
    text: "user_${DateTime.now().millisecond}",
  );
  final userNameTextCtrl = TextEditingController(
    text: "User_${DateTime.now().millisecond}",
  );
  final targetUserIDTextCtrl = TextEditingController();

  void onLogin() {
    myID.value = userIDTextCtrl.text.trim();
    myName.value = userNameTextCtrl.text.trim();

    if (myID.isEmpty || myName.isEmpty) return;

    // initialize Zego Service
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: int.parse(dotenv.env['APP_ID']!),
      appSign: dotenv.env['APP_SIGN']!,
      userID: myID.value,
      userName: myName.value,
      plugins: [ZegoUIKitSignalingPlugin()],
      config: ZegoCallInvitationConfig(canInvitingInCalling: true),
    );

    Get.to(() => const HomePage());
  }

  void onLogout() {
    ZegoUIKitPrebuiltCallInvitationService().uninit();
    Get.back();
  }
}
