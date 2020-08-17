import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MinusIntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.9,
                aspectRatio: 1,
                height: MediaQuery.of(context).size.width - 48,
                enableInfiniteScroll: false,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Text(i.toString()),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            Text(
              'asda asdasd',
              style: Theme.of(context).textTheme.headline3,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              child: Text('Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an,'),
            ),
            Spacer(),
            RaisedButton(
              onPressed: () {},
              child: Text('Lanjut'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}
