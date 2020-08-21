import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionScreen extends StatelessWidget {
  final GlobalController gc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Izinkan Kamera'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Text(
            'Applikasi ini bergantung dengan kamera untuk:',
            style: Theme.of(context).textTheme.headline6,
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
          SizedBox(height: 24),
          Text(
            'Privasi berkaitan dengan kamera:',
            style: Theme.of(context).textTheme.headline6,
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
            onPressed: () async {
              final status = await Permission.camera.request();

              if (status == PermissionStatus.granted) Get.back();
            },
            child: Text('Berikan Permisi'),
          )
        ],
      ),
    );
  }
}
