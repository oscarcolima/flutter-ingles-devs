import 'dart:convert';

class TecnologiasModel {
  final int id;
  final String technology;
  final String icon;
  
  TecnologiasModel({
    required this.id,
    required this.technology,
    required this.icon,
  });

  TecnologiasModel copyWith({
    int? id,
    String? technology,
    String? icon,
  }) {
    return TecnologiasModel(
      id: id ?? this.id,
      technology: technology ?? this.technology,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'technology': technology,
      'icon': icon,
    };
  }

  factory TecnologiasModel.fromMap(Map<String, dynamic> map) {
    return TecnologiasModel(
      id: map['id'] as int,
      technology: map['technology'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TecnologiasModel.fromJson(String source) =>
      TecnologiasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TecnologiasModel(id: $id, technology: $technology, icon: $icon)';

  @override
  bool operator ==(covariant TecnologiasModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.technology == technology &&
      other.icon == icon;
  }

  @override
  int get hashCode => id.hashCode ^ technology.hashCode ^ icon.hashCode;
}

class Catalogos {
  late dynamic value;
  late String texto;
  Catalogos({
    required this.value,
    required this.texto,
  });
}
