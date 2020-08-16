import 'dart:async';

import 'package:app/app/controller/basecontroller.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MinusController extends BaseController {
  stt.SpeechToText speech = stt.SpeechToText();
  List<SpeechRecognitionWords> words = [];
  bool available = false;
  Timer _timer;

  @override
  void onInit() {
    super.onInit();
    initController();
  }

  @override
  void onClose() {
    super.onClose();
    speech.stop();
    _timer.cancel();
  }

  initController() async {
    available = await speech.initialize(onStatus: (v) {}, onError: (e) {});
    // final a = await speech.locales();
    // print(a.map((e) => e.localeId).toList());
    if (available) {
      record();
    } else {
      print("The user has denied the use of speech recognition.");
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(speech.isListening);

      if (!speech.isListening) {
        record();
      }
    });
  }

  record() async {
    speech.listen(
      listenFor: Duration(seconds: 3),
      onResult: (v) {
        print(v.toString());
        words = v.alternates;
        update();
      },
    );
  }
}
