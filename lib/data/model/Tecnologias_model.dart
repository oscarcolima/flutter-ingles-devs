// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TecnologiasModel {
  final int id;
  final String name;
  final String icon;
  
  TecnologiasModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  TecnologiasModel copyWith({
    int? id,
    String? name,
    String? icon,
  }) {
    return TecnologiasModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
    };
  }

  factory TecnologiasModel.fromMap(Map<String, dynamic> map) {
    return TecnologiasModel(
      id: map['id'] as int,
      name: map['name'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TecnologiasModel.fromJson(String source) =>
      TecnologiasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TecnologiasModel(id: $id, name: $name, icon: $icon)';

  @override
  bool operator ==(covariant TecnologiasModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.icon == icon;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ icon.hashCode;
}

class Catalogos {
  late dynamic value;
  late String texto;
  Catalogos({
    required this.value,
    required this.texto,
  });
}
