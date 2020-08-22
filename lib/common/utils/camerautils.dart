import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:app/common/model/facedirectios.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/foundation.dart';

mixin CameraUtil {
  FaceDirections defineHeadDirection(double angleY, double angleZ) {
    if (Platform.isAndroid) {
      if ((angleY < -15) && angleZ < -3)
        return FaceDirections.topright;
      else if (angleY > 15 && angleZ > 3)
        return FaceDirections.topleft;
      else if (angleY > 15 && angleZ < 3)
        return FaceDirections.bottomleft;
      else if (angleY < -15 && angleZ > 3)
        return FaceDirections.bottomright;
      else
        return FaceDirections.nan;
    } else {
      if ((angleY < 15) && angleZ < -3)
        return FaceDirections.topright;
      else if (angleY > -15 && angleZ > 3)
        return FaceDirections.topleft;
      else if (angleY > -15 && angleZ < 3)
        return FaceDirections.bottomleft;
      else if (angleY < 15 && angleZ > 3)
        return FaceDirections.bottomright;
      else
        return FaceDirections.nan;
    }
  }

  Uint8List concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }

  FirebaseVisionImageMetadata buildMetaData(CameraImage image, CameraDescription cam) {
    return FirebaseVisionImageMetadata(
      rawFormat: image.format.raw,
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: _rotationIntToImageRotation(cam),
      planeData: image.planes.map(
        (Plane plane) {
          return FirebaseVisionImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList(),
    );
  }

  ImageRotation _rotationIntToImageRotation(CameraDescription cam) {
    switch (cam.sensorOrientation) {
      case 0:
        return ImageRotation.rotation0;
      case 90:
        return ImageRotation.rotation90;
      case 180:
        return ImageRotation.rotation180;
      default:
        assert(cam.sensorOrientation == 270);
        return ImageRotation.rotation270;
    }
  }
}
