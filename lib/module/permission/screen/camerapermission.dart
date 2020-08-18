import 'package:app/app/route/approute.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CameraPermissionScreen extends StatelessWidget {
  final GlobalController gc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penggunaan Camera'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Lottie.asset(
            'assets/camera.json',
            height: 200,
            animate: true,
            repeat: true,
          ),
          Text(
            'Applikasi ini bergantung dengan kamera untuk:',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 24),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('Mendeteksi wajah anda.'),
            contentPadding: EdgeInsets.all(0),
          ),
          ListTile(
            leading: Icon(Icons.exposure),
            title: Text('Menghitung estimasi jarak antara smartphone dengan anda.'),
            contentPadding: EdgeInsets.all(0),
          ),
          ListTile(
            leading: Icon(Icons.tag_faces),
            title: Text('Membaca gerakan gesture kepala anda.'),
            contentPadding: EdgeInsets.all(0),
          ),
          ListTile(
            leading: Icon(Icons.remove_red_eye),
            title: Text('Memastikan mata anda tidak tertutup (BETA).'),
            contentPadding: EdgeInsets.all(0),
          ),
          SizedBox(height: 24),
          Text(
            'Privasi berkaitan dengan kamera:',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 24),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Aplikasi ini tidak menyimpan wajah diluar dari perangkat anda.'),
            contentPadding: EdgeInsets.all(0),
          ),
          ListTile(
            leading: Icon(Icons.signal_wifi_off),
            title: Text('Aplikasi ini tidak mengirim wajah anda ke server manapun.'),
            contentPadding: EdgeInsets.all(0),
          ),
          SizedBox(height: 24),
          RaisedButton(
            onPressed: () {
              gc.cameraRead();
              Get.offNamed(AppRoute.minusIntroPage);
            },
            child: Text('Mulai'),
          )
        ],
      ),
    );
  }
}
