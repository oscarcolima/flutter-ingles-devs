import 'dart:convert';

class RegistroModel {
  late int id; //: 0,
  late String nombrecompleto; //: "string",
  late String telefono; //: "string",
  late String email; //: "string",
  late String profesion; //: "string",
  late int experiencia; //: 0,
  late int technology; //: 0,
  late int? score; //: 0
  RegistroModel({
    this.id = 0,
    this.nombrecompleto = "",
    this.telefono = "",
    this.email = "",
    this.profesion = "",
    this.experiencia = 0,
    this.technology = 0,
    this.score,
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
    };
  }

  factory RegistroModel.fromMap(Map<String, dynamic> map) {
    return RegistroModel(
      id: map['id'] as int,
      nombrecompleto: map['nombre_completo'] as String,
      telefono: map['telefono'] as String,
      email: map['email'] as String,
      profesion: map['profesion'] as String,
      experiencia: map['experiencia'] as int,
      technology: map['fk_technology'] as int,
      score: map['score'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistroModel.fromJson(String source) =>
      RegistroModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistroModel(id: $id, nombre_completo: $nombrecompleto, telefono: $telefono, email: $email, profesion: $profesion, experiencia: $experiencia, fk_technology: $technology, score: $score)';
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
        other.score == score;
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
        score.hashCode;
  }
}
