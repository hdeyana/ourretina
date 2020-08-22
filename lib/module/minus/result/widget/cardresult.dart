import 'package:app/common/utils/resultutils.dart';
import 'package:flutter/material.dart';

class CardResult extends StatelessWidget {
  final bool isKiri;
  final int result;
  final int total;
  CardResult({@required this.isKiri, @required this.result, @required this.total});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: ResultUtils.defineColor(context, result, total),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Text(
            '${isKiri ? "Kiri" : "Kanan"}',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          Container(
            height: 200,
            child: Center(
              child: Text(
                "${result ?? 0}",
                style: TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(
            '/$total',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
