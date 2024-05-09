// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_ingles_devs/data/model/answers_model.dart';

class QuestionsModel {
  int id;
  String question;
  String type;
  int rightScore;
  int wrongScore;
  DateTime createat;
  DateTime updateat;
  List<AnswersModel>? answers;
  QuestionsModel({
    required this.id,
    required this.question,
    required this.type,
    required this.rightScore,
    required this.wrongScore,
    required this.createat,
    required this.updateat,
    required this.answers,
  });

  QuestionsModel copyWith({
    int? id,
    String? question,
    String? type,
    int? rightScore,
    int? wrongScore,
    DateTime? createat,
    DateTime? updateat,
    List<AnswersModel>? answers,
  }) {
    return QuestionsModel(
      id: id ?? this.id,
      question: question ?? this.question,
      type: type ?? this.type,
      rightScore: rightScore ?? this.rightScore,
      wrongScore: wrongScore ?? this.wrongScore,
      createat: createat ?? this.createat,
      updateat: updateat ?? this.updateat,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'type': type,
      'rightScore': rightScore,
      'wrongScore': wrongScore,
      'create_at': createat.toIso8601String(),
      'update_at': updateat.toIso8601String(),
      'answers': answers?.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionsModel.fromMap(Map<String, dynamic> map) {
    return QuestionsModel(
      id: map['id'] as int,
      question: map['question'] as String,
      type: map['type'] as String,
      rightScore: map['rightScore'] as int,
      wrongScore: map['wrongScore'] as int,
      createat: DateTime.parse(map['create_at'] ),
      updateat: DateTime.parse(map['update_at']),
      answers: map['answers'] != null
          ? List<AnswersModel>.from(
              (map['answers'] as List<dynamic>).map<AnswersModel?>(
                (x) => AnswersModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionsModel.fromJson(String source) =>
      QuestionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuestionsModel(id: $id, question: $question, type: $type, rightScore: $rightScore, wrongScore: $wrongScore, createat: $createat, updateat: $updateat, answers: $answers)';
  }

  @override
  bool operator ==(covariant QuestionsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.question == question &&
        other.type == type &&
        other.rightScore == rightScore &&
        other.wrongScore == wrongScore &&
        other.createat == createat &&
        other.updateat == updateat &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        type.hashCode ^
        rightScore.hashCode ^
        wrongScore.hashCode ^
        createat.hashCode ^
        updateat.hashCode ^
        answers.hashCode;
  }
}
