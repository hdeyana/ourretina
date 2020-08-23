import 'package:app/generated/l10n.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionScreen extends StatelessWidget {
  final GlobalController gc = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final status = await Permission.camera.status;

        return status == PermissionStatus.granted;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).izinkanKamera),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Text(
              S.of(context).applikasiIniBergantungDenganKameraUntuk,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.face),
              title: Text(S.of(context).mendeteksiWajahAnda),
              contentPadding: EdgeInsets.all(0),
            ),
            ListTile(
              leading: Icon(Icons.exposure),
              title: Text(S.of(context).menghitungEstimasiJarakAntaraSmartphoneDenganAnda),
              contentPadding: EdgeInsets.all(0),
            ),
            ListTile(
              leading: Icon(Icons.tag_faces),
              title: Text(S.of(context).membacaGerakanGestureKepalaAnda),
              contentPadding: EdgeInsets.all(0),
            ),
            SizedBox(height: 24),
            Text(
              S.of(context).privasiBerkaitanDenganKamera,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.security),
              title: Text(S.of(context).aplikasiIniTidakMenyimpanWajahDiluarDariPerangkatAnda),
              contentPadding: EdgeInsets.all(0),
            ),
            ListTile(
              leading: Icon(Icons.signal_wifi_off),
              title: Text(S.of(context).aplikasiIniTidakMengirimWajahAndaKeServerManapun),
              contentPadding: EdgeInsets.all(0),
            ),
            SizedBox(height: 24),
            RaisedButton(
              onPressed: () async {
                final status = await Permission.camera.request();

                if (status == PermissionStatus.granted) Get.back();
              },
              child: Text(S.of(context).berikanPermisi),
            )
          ],
        ),
      ),
    );
  }
}
