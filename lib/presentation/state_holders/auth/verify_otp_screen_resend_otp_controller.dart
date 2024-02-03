import 'dart:async';
import 'package:get/get.dart';

class VerifyOTPScreenResendOTPController extends GetxController {
  late Timer _timer;
  int countTime = 120;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if(countTime == 0) {
        _timer.cancel();
        update();
      }
      else {
        countTime--;
        update();
      }
    });
  }

}