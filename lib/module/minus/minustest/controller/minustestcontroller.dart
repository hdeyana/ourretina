import 'dart:ui';

import 'package:app/app/controller/basecontroller.dart';
import 'package:app/app/route/approute.dart';
import 'package:app/common/model/facedirectios.dart';
import 'package:app/common/utils/camerautils.dart';
import 'package:app/module/minus/minustest/data/model/minustestmodel.dart';
import 'package:app/module/minus/minustest/widget/minustestwidget.dart';
import 'package:app/module/minus/minustest/widget/simpanteleponjauh.dart';
import 'package:app/module/minus/minustest/widget/trymovehead.dart';
import 'package:app/module/minus/minustest/widget/tutupmata.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class MinusTestController extends BaseController with CameraUtil {
  RxString warningText = "".obs;
  int currentStep = 0;
  List<MinusTestModel> answer = [];

  final steps = <Widget>[
    TryMoveHead(),
    SimpantTeleponJauh(),
    TutupMata(false),
    MinusTestWidget(),
    TutupMata(true),
    MinusTestWidget(),
  ];

  nextStep() {
    if (currentStep < steps.length - 1) {
      currentStep++;
      update();
    } else {
      Get.offNamed(AppRoute.minusResultPage, arguments: answer);
    }
  }

  addAnswer(MinusTestModel test) {
    answer.add(test);
  }

  @override
  void onInit() {
    initializeCamera();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    close();
  }

  CameraController minuscameraController;
  List<CameraDescription> cameras = [];
  final FaceDetector faceDetector = FirebaseVision.instance.faceDetector(
    FaceDetectorOptions(enableClassification: true, mode: FaceDetectorMode.accurate, enableTracking: true),
  );
  bool _mounted = true;
  bool _isDetecting = false;
  Rect faceRect;
  Rx<FaceDirections> facedirection = FaceDirections.nan.obs;

  close() async {
    _mounted = false;
    await minuscameraController?.dispose();
    await faceDetector?.close();
  }

  initializeCamera() async {
    final status = await Permission.camera.status;
    print(status);

    if (status == PermissionStatus.granted) {
      if (cameras.isEmpty) {
        try {
          cameras = await availableCameras();
        } catch (e) {
          debugPrint(e.toString());
        }
      }

      final c = cameras[1] != null ? cameras[1] : null;
      onNewCameraSelected(c);
    } else {
      Get.toNamed(AppRoute.cameraPermision);
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (minuscameraController != null) {
      await minuscameraController.dispose();
    }
    minuscameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await minuscameraController.initialize();

      startStream();
    } on CameraException catch (e) {
      print(e);
    }
  }

  void startStream() {
    try {
      minuscameraController.startImageStream((data) async {
        if (_mounted && !_isDetecting) {
          if (_isDetecting) return;

          _isDetecting = true;

          final image = FirebaseVisionImage.fromBytes(concatenatePlanes(data.planes), buildMetaData(data, cameras[1]));
          final List<Face> faces = await faceDetector.processImage(image);
          _isDetecting = false;
          if (faces.isNotEmpty) {
            warningText.value = "";
            faceRect = faces[0].boundingBox;
            final dirc = defineHeadDirection(faces[0].headEulerAngleY, faces[0].headEulerAngleZ);
            facedirection.value = dirc;

            if (_mounted) update();
          } else {
            warningText.value = "Tidak dapat menemukan Wajah";
          }
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
