import 'package:app/module/minus/result/widget/cardresult.dart';
import 'package:flutter/material.dart';

class MinusResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Test'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Text(
            'Periksa Dokter',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 24),
          Text(
            'Kemungkinan mata sebelah kanan kamu bermasalah, kunjungi dokter mata terdekatmu',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                Expanded(child: CardResult()),
                SizedBox(width: 24),
                Expanded(child: CardResult()),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            '18 July 2020',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                'Beranda',
                style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).accentColor),
              ),
            ),
          ),
          SizedBox(height: 36),
          Text(
            'Disclaimer',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'Hasil tes tidak dapat menggantikan saran dari dokter',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
