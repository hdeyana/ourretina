import 'dart:convert';

class MinusTestModel {
  int question;
  int answer;
  DateTime answeredAt;
  int fontSize;
  MinusTestModel({
    this.question,
    this.answer,
    this.answeredAt,
    this.fontSize,
  });

  MinusTestModel copyWith({
    int question,
    int answer,
    DateTime answeredAt,
    int fontSize,
  }) {
    return MinusTestModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      answeredAt: answeredAt ?? this.answeredAt,
      fontSize: fontSize ?? this.fontSize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
      'answeredAt': answeredAt?.millisecondsSinceEpoch,
      'fontSize': fontSize,
    };
  }

  factory MinusTestModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MinusTestModel(
      question: map['question'],
      answer: map['answer'],
      answeredAt: DateTime.fromMillisecondsSinceEpoch(map['answeredAt']),
      fontSize: map['fontSize'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MinusTestModel.fromJson(String source) => MinusTestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MinusTestModel(question: $question, answer: $answer, answeredAt: $answeredAt, fontSize: $fontSize)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MinusTestModel && o.question == question && o.answer == answer && o.answeredAt == answeredAt && o.fontSize == fontSize;
  }

  @override
  int get hashCode {
    return question.hashCode ^ answer.hashCode ^ answeredAt.hashCode ^ fontSize.hashCode;
  }
}

enum TestDerections { up, down, left, right }

extension on TestDerections {}
