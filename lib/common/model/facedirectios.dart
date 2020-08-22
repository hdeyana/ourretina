enum FaceDirections {
  topleft,
  topright,
  bottomleft,
  bottomright,
  nan,
}

extension Direction on FaceDirections {
  double getAngle() {
    switch (this) {
      case FaceDirections.topleft:
        return 0.5;
        break;
      case FaceDirections.topright:
        return -0.5;
        break;
      case FaceDirections.bottomleft:
        return 1;
        break;
      default:
        return 0;
    }
  }
}

extension GetFace on int {
  FaceDirections getFaceDirection() {
    switch (this) {
      case 0:
        return FaceDirections.topleft;
        break;
      case 1:
        return FaceDirections.topright;
        break;
      case 2:
        return FaceDirections.bottomleft;
        break;
      case 3:
        return FaceDirections.bottomright;
        break;

      default:
        return FaceDirections.nan;
    }
  }

  String getFaceName() {
    switch (this) {
      case 0:
        return "ATAS";
        break;
      case 1:
        return "KANAN";
        break;
      case 2:
        return "KIRI";
        break;
      case 3:
        return "BAWAH";
        break;

      default:
        return "";
    }
  }
}
