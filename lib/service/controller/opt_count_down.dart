import 'dart:async';
import 'package:get/get.dart';

class CountdownController extends GetxController {
  var timeLeft = 300.obs; // 5 minutes in seconds
  Timer? _timer;

  void startTimer() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void resetTimer() {
    stopTimer();
    timeLeft.value = 300; 
  }

  @override
  void onClose() {
    stopTimer(); 
    super.onClose();
  }

  String get formattedTime {
    int minutes = timeLeft.value ~/ 60;
    int seconds = timeLeft.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
