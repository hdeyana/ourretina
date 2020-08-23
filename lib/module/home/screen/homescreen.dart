import 'package:app/app/assets/appassets.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/module/home/widget/homebottom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: () async {
              final currentLocal = Intl.getCurrentLocale();

              await S.load(Locale.fromSubtags(languageCode: currentLocal == 'id' ? 'en' : 'id'));
              setState(() {});
            },
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.bg,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.saturation,
            color: Colors.grey,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).primaryColor.withAlpha(75),
          ),
          HomeBottom(),
        ],
      ),
    );
  }
}
