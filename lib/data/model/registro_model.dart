// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegistroModel {
  late int? id;
  late String nombrecompleto;
  late String telefono;
  late String email;
  late String profesion;
  late int experiencia;
  late int technology;
  late int? score;
  late int? correctanswers;
  late String? level;
  RegistroModel({
    this.id = 0,
    this.nombrecompleto = "",
    this.telefono = "",
    this.email = "",
    this.profesion = "",
    this.experiencia = 0,
    this.technology = 0,
    this.score,
    this.correctanswers,
    this.level,
  });

  RegistroModel copyWith({
    int? id,
    String? nombrecompleto,
    String? telefono,
    String? email,
    String? profesion,
    int? experiencia,
    int? technology,
    int? score,
    int? correctanswers,
    String? level,
  }) {
    return RegistroModel(
      id: id ?? this.id,
      nombrecompleto: nombrecompleto ?? this.nombrecompleto,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      profesion: profesion ?? this.profesion,
      experiencia: experiencia ?? this.experiencia,
      technology: technology ?? this.technology,
      score: score ?? this.score,
      correctanswers: correctanswers ?? this.correctanswers,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nombre_completo': nombrecompleto,
      'telefono': telefono,
      'email': email,
      'profesion': profesion,
      'experiencia': experiencia,
      'fk_technology': technology,
      'score': score,
      'correct_answers': correctanswers,
      'level': level,
    };
  }

  factory RegistroModel.fromMap(Map<String, dynamic> map) {
    return RegistroModel(
      id: map['id'] != null ? map['id'] as int : null,
      nombrecompleto: map['nombre_completo'] as String,
      telefono: map['telefono'] as String,
      email: map['email'] as String,
      profesion: map['profesion'] as String,
      experiencia: map['experiencia'] as int,
      technology: map['fk_technology'] as int,
      score: map['score'] != null ? map['score'] as int : null,
      correctanswers:
          map['correct_answers'] != null ? map['correct_answers'] as int : null,
      level: map['level'] != null ? map['level'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistroModel.fromJson(String source) =>
      RegistroModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistroModel(id: $id, nombre_completo: $nombrecompleto, telefono: $telefono, email: $email, profesion: $profesion, experiencia: $experiencia, fk_technology: $technology, score: $score, correct_answers: $correctanswers, level: $level)';
  }

  @override
  bool operator ==(covariant RegistroModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nombrecompleto == nombrecompleto &&
        other.telefono == telefono &&
        other.email == email &&
        other.profesion == profesion &&
        other.experiencia == experiencia &&
        other.technology == technology &&
        other.score == score &&
        other.correctanswers == correctanswers &&
        other.level == level;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nombrecompleto.hashCode ^
        telefono.hashCode ^
        email.hashCode ^
        profesion.hashCode ^
        experiencia.hashCode ^
        technology.hashCode ^
        score.hashCode ^
        correctanswers.hashCode ^
        level.hashCode;
  }
}
