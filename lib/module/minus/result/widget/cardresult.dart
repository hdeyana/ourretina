import 'package:flutter/material.dart';

class CardResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Kiri',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Container(
            height: 200,
            child: Center(
              child: Text(
                '87',
                style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(
            '/100',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
