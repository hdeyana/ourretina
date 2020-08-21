import 'package:app/common/model/facedirectios.dart';
import 'package:app/common/widget/arrowdirection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CobaGerakanKepala extends StatefulWidget {
  @override
  _CobaGerakanKepalaState createState() => _CobaGerakanKepalaState();
}

class _CobaGerakanKepalaState extends State<CobaGerakanKepala> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (cam) {
      if (cam.cameraController == null)
        return Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Tidak Dapat Mengakses Kamera'),
                RaisedButton(
                  onPressed: () => cam.initializeCamera(),
                  child: Text('Hidupkan Kamera'),
                )
              ],
            ),
          ),
        );
      return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1,
        padding: const EdgeInsets.all(36.0),
        physics: NeverScrollableScrollPhysics(),
        children: [
          ArrowDirection(
            directions: ArrowDirections.down,
            circleColor: cam.facedirection == FaceDirections.topleft ? Theme.of(context).accentColor : null,
          ),
          ArrowDirection(
            directions: ArrowDirections.up,
            circleColor: cam.facedirection == FaceDirections.topright ? Theme.of(context).accentColor : null,
          ),
          ArrowDirection(
            directions: ArrowDirections.left,
            circleColor: cam.facedirection == FaceDirections.bottomleft ? Theme.of(context).accentColor : null,
          ),
          ArrowDirection(
            directions: ArrowDirections.right,
            circleColor: cam.facedirection == FaceDirections.bottomright ? Theme.of(context).accentColor : null,
          ),
        ],
      );
    });
  }
}
