import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  final String userID;
  final String callID;
  const CallPage({super.key, required this.userID, required this.callID});

  @override
  Widget build(BuildContext context) {
    // return ZegoUIKitPrebuiltCall(
    //   appID: 1398680085, // <-- अपने ZEGOCLOUD App ID से बदलें (int)
    //   appSign: '122d7b1fea005f18c4d1c90da9d4ff7023760fa1c4f6a67a2f87d47c04c6aa67', // <-- App Sign से बदलें (String)
    //   userID: userID,
    //   userName: "user_$userID",
    //   callID: callID,
    //   config:
    //       ZegoUIKitPrebuiltCallConfig.groupVideoCall()
    //         ..turnOnCameraWhenJoining = true
    //         ..turnOnMicrophoneWhenJoining = true,
    // );
    return ZegoUIKitPrebuiltCall(
        appID: 1398680085,
        callID: callID,
        userID: userID,
        userName: "user_$userID",
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
          ..turnOnCameraWhenJoining = true
          ..turnOnMicrophoneWhenJoining = true);
  }
}
