import 'package:app/app/controller/basecontroller.dart';
import 'package:app/app/route/approute.dart';
import 'package:app/common/model/facedirectios.dart';
import 'package:app/common/utils/camerautils.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraFaceController extends BaseController with CameraUtil {
  CameraController cameraController;
  List<CameraDescription> cameras = [];
  final FaceDetector faceDetector = FirebaseVision.instance.faceDetector(
    FaceDetectorOptions(enableClassification: true, mode: FaceDetectorMode.accurate, enableTracking: true),
  );
  bool _mounted = true;
  bool _isDetecting = false;
  Rect faceRect;
  double angleZ = 0;
  double angleY = 0;
  FaceDirections facedirection = FaceDirections.nan;

  @override
  void onClose() {
    super.onClose();
    close();
  }

  close() async {
    _mounted = false;
    await cameraController?.dispose();
    await faceDetector?.close();
  }

  initializeCamera() async {
    final status = await Permission.camera.status;
    print(status);

    if (status == PermissionStatus.granted) {
      try {
        cameras = await availableCameras();
        final c = cameras[1] != null ? cameras[1] : cameras[0];
        onNewCameraSelected(c);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      Get.toNamed(AppRoute.cameraPermision);
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }
    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await cameraController.initialize();
      startStream();
    } on CameraException catch (e) {
      print(e);
    }
    update();
  }

  startStream() {
    try {
      cameraController.startImageStream((data) async {
        if (_mounted && !_isDetecting) {
          if (_isDetecting) return;

          _isDetecting = true;

          final image = FirebaseVisionImage.fromBytes(concatenatePlanes(data.planes), buildMetaData(data, cameras[1]));
          final List<Face> faces = await faceDetector.processImage(image);
          _isDetecting = false;
          if (faces.isNotEmpty) {
            faceRect = faces[0].boundingBox;
            final dirc = defineHeadDirection(faces[0].headEulerAngleY, faces[0].headEulerAngleZ);
            facedirection = dirc;

            if (_mounted) update();
          }
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
