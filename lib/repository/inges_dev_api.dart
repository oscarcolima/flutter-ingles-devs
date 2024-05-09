// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';

import '../data/model/questions_model.dart';
import '../data/model/registro_model.dart';
import '../data/model/tecnologias_model.dart';

class IngesDevApi {
  static final _uri = "http://localhost:5015/api";

  static RegistroApi registro() => RegistroApi(baseUrl: "$_uri/Registro");
  static TestApi test() => TestApi(baseUrl: "$_uri/Test");
}

class RegistroApi {
  final String baseUrl;

  RegistroApi({required this.baseUrl});

  Future<List<TecnologiasModel>?> getTecnologias() async {
    try {
      final dio = Dio();
      final response = await dio.get('$baseUrl/tecnologias');
      final res = (response.data as List<dynamic>)
          .map((e) => TecnologiasModel.fromMap(e as Map<String, dynamic>))
          .toList();

      return res;
    } catch (e) {
      log(e.toString(), name: "getTecnologias");
    }
    return null;
  }

  Future<RegistroModel?> registrar(RegistroModel registro) async {
    try {
      final dio = Dio();
      final response =
          await dio.post('$baseUrl/registrar', data: registro.toJson());
      final newRegistro = RegistroModel.fromMap(response.data);

      return newRegistro;
    } catch (e) {
      log(e.toString(), name: "registrar");
    }
    return null;
  }
}

class TestApi {
  final String baseUrl;
  TestApi({required this.baseUrl});

  Future<List<QuestionsModel>?> getquestions() async {
    try {
      final dio = Dio();
      final response = await dio.get('$baseUrl/getquestions');
      final questions = (response.data as List<dynamic>)
        .map((e) => QuestionsModel.fromMap(e as Map<String, dynamic>))
        .toList();

      return questions;
    } catch (e) {
      log(e.toString(), name: "getquestions");
    }
    return null;
  }
}
