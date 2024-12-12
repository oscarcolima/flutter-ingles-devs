// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegistroModel {
  late int? id;
  late String nombreCompleto;
  late String telefono;
  late String codigoPais;
  late String email;
  late String profesion;
  late String experiencia;
  late int technology;
  late int? score;
  late int? correctaAnswers;
  late String? level;
  late bool eliminado;
  late DateTime date;

  RegistroModel({
    this.id = 0,
    this.nombreCompleto = "",
    this.telefono = "",
    this.codigoPais = "+52",
    this.email = "",
    this.profesion = "",
    this.experiencia = "0",
    this.technology = 0,
    this.score,
    this.correctaAnswers,
    this.level,
    this.eliminado = false,
    DateTime? date,
  }) : date = date ?? DateTime.now();

  RegistroModel copyWith({
    int? id,
    String? nombreCompleto,
    String? telefono,
    String? codigoPais,
    String? email,
    String? profesion,
    String? experiencia,
    int? technology,
    int? score,
    int? correctaAnswers,
    String? level,
  }) {
    return RegistroModel(
      id: id ?? this.id,
      nombreCompleto: nombreCompleto ?? this.nombreCompleto,
      telefono: telefono ?? this.telefono,
      codigoPais: codigoPais ?? this.codigoPais,
      email: email ?? this.email,
      profesion: profesion ?? this.profesion,
      experiencia: experiencia ?? this.experiencia,
      technology: technology ?? this.technology,
      score: score ?? this.score,
      correctaAnswers: correctaAnswers ?? this.correctaAnswers,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nombre_completo': nombreCompleto,
      'telefono': telefono,
      'email': email,
      'profesion': profesion,
      'experiencia': experiencia,
      'fk_technology': technology,
      'score': score,
      'correct_answers': correctaAnswers,
      'level': level,
      'eliminado': eliminado,
      'date': date.toIso8601String(),
    };
  }

  factory RegistroModel.fromMap(Map<String, dynamic> map) {
    return RegistroModel(
      id: map['id'] != null ? map['id'] as int : null,
      nombreCompleto: map['nombre_completo'] as String,
      telefono: map['telefono'] as String,
      email: map['email'] as String,
      profesion: map['profesion'] as String,
      experiencia: map['experiencia'] as String,
      technology: map['fk_technology'] as int,
      score: map['score'] != null ? map['score'] as int : null,
      correctaAnswers:
          map['correct_answers'] != null ? map['correct_answers'] as int : null,
      level: map['level'] != null ? map['level'] as String : null,
      eliminado: map['eliminado'] != null ? map['eliminado'] as bool : false,
      date: DateTime.parse(map['date'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistroModel.fromJson(String source) =>
      RegistroModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistroModel(id: $id, nombre_completo: $nombreCompleto, telefono: $telefono, email: $email, profesion: $profesion, experiencia: $experiencia, fk_technology: $technology, score: $score, correct_answers: $correctaAnswers, level: $level)';
  }

  @override
  bool operator ==(covariant RegistroModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nombreCompleto == nombreCompleto &&
        other.telefono == telefono &&
        other.email == email &&
        other.profesion == profesion &&
        other.experiencia == experiencia &&
        other.technology == technology &&
        other.score == score &&
        other.correctaAnswers == correctaAnswers &&
        other.level == level;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nombreCompleto.hashCode ^
        telefono.hashCode ^
        email.hashCode ^
        profesion.hashCode ^
        experiencia.hashCode ^
        technology.hashCode ^
        score.hashCode ^
        correctaAnswers.hashCode ^
        level.hashCode;
  }
}
