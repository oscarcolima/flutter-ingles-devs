// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnswersModel {
  int id;
  String answer;
  int question;
  bool iscorrect;
  DateTime createat;
  DateTime updateat;
  AnswersModel({
    required this.id,
    required this.answer,
    required this.question,
    required this.iscorrect,
    required this.createat,
    required this.updateat,
  });

  AnswersModel copyWith({
    int? id,
    String? answer,
    int? question,
    bool? iscorrect,
    DateTime? createat,
    DateTime? updateat,
  }) {
    return AnswersModel(
      id: id ?? this.id,
      answer: answer ?? this.answer,
      question: question ?? this.question,
      iscorrect: iscorrect ?? this.iscorrect,
      createat: createat ?? this.createat,
      updateat: updateat ?? this.updateat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'answer': answer,
      'fk_question': question,
      'iscorrect': iscorrect,
      'create_at': createat.toIso8601String(),
      'update_at': updateat.toIso8601String(),
    };
  }

  factory AnswersModel.fromMap(Map<String, dynamic> map) {
    return AnswersModel(
      id: map['id'] as int,
      answer:map['answer'] as String,
      question: map['fk_question'] as int,
      iscorrect: map['iscorrect'] as bool,
      createat: DateTime.parse(map['create_at'] ),
      updateat: DateTime.parse(map['update_at'] ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswersModel.fromJson(String source) => AnswersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnswersModel(id: $id, answer: $answer, fk_question: $question, iscorrect: $iscorrect, create_at: $createat, update_at: $updateat)';
  }

  @override
  bool operator ==(covariant AnswersModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.answer == answer &&
      other.question == question &&
      other.iscorrect == iscorrect &&
      other.createat == createat &&
      other.updateat == updateat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      answer.hashCode ^
      question.hashCode ^
      iscorrect.hashCode ^
      createat.hashCode ^
      updateat.hashCode;
  }
}
