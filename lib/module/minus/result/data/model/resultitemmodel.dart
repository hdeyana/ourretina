import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/module/minus/minustest/data/model/minustestmodel.dart';

class ResultItemModel {
  List<MinusTestModel> results;
  int leftScore;
  int rightScore;
  int total;
  String testAt;
  ResultItemModel({
    this.results,
    this.leftScore,
    this.rightScore,
    this.total,
    this.testAt,
  });

  ResultItemModel copyWith({
    List<MinusTestModel> results,
    int leftScore,
    int rightScore,
    int total,
    String testAt,
  }) {
    return ResultItemModel(
      results: results ?? this.results,
      leftScore: leftScore ?? this.leftScore,
      rightScore: rightScore ?? this.rightScore,
      total: total ?? this.total,
      testAt: testAt ?? this.testAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'results': results?.map((x) => x?.toMap())?.toList(),
      'leftScore': leftScore,
      'rightScore': rightScore,
      'total': total,
      'testAt': testAt,
    };
  }

  factory ResultItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultItemModel(
      results: List<MinusTestModel>.from(map['results']?.map((x) => MinusTestModel.fromMap(x))),
      leftScore: map['leftScore'],
      rightScore: map['rightScore'],
      total: map['total'],
      testAt: map['testAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultItemModel.fromJson(String source) => ResultItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResultItemModel(results: $results, leftScore: $leftScore, rightScore: $rightScore, total: $total, testAt: $testAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ResultItemModel && listEquals(o.results, results) && o.leftScore == leftScore && o.rightScore == rightScore && o.total == total && o.testAt == testAt;
  }

  @override
  int get hashCode {
    return results.hashCode ^ leftScore.hashCode ^ rightScore.hashCode ^ total.hashCode ^ testAt.hashCode;
  }
}
