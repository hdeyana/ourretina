import 'package:app/app/route/approute.dart';
import 'package:app/common/utils/resultutils.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/module/minus/result/data/model/resultitemmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HasiTestItem extends StatelessWidget {
  final ResultItemModel result;
  HasiTestItem(this.result);
  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(result.testAt);
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoute.minusResultPage, arguments: result),
      child: Container(
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            _Score(result, true),
            SizedBox(width: 16),
            _Score(result, false),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(S.of(context).tanggal),
                Spacer(),
                Text(
                  date.day.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                Text(
                  DateFormat.yMMMM().format(date),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Score extends StatelessWidget {
  final ResultItemModel item;
  final bool isLeft;
  _Score(this.item, this.isLeft);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(isLeft ? S.of(context).kiriResult : S.of(context).kananResult),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ResultUtils.defineColor(context, isLeft ? item.leftScore : item.rightScore, item.total),
              borderRadius: BorderRadius.circular(8),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "${isLeft ? item.leftScore : item.rightScore}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "/${item.total}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ],
    );
  }
}
