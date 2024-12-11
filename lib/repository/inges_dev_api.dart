// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../data/model/questions_model.dart';
import '../data/model/registro_model.dart';
import '../data/model/tecnologias_model.dart';

class IngesDevApi {
  static const _uri = String.fromEnvironment("API");

  static RegistroApi registro() => RegistroApi(baseUrl: "$_uri/Registro");
  static TestApi test() => TestApi(baseUrl: "$_uri/Test");
  static Panel panel() => Panel(baseUrl: "$_uri/Panel");
  static Preguntas pregunta() => Preguntas(baseUrl: "$_uri/Pregunta");
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
      registro.telefono = registro.codigoPais + registro.telefono;
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse('$baseUrl/registrar'));
      request.body = registro.toJson();
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      final res = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return RegistroModel.fromJson(res);
      } else {
        // print(response.statusMessage);
        return null;
      }
      /* final response =
          await dio.post('$baseUrl/registrar', data: registro.toJson());
      final newRegistro = RegistroModel.fromMap(response.data);

      return newRegistro; */
    } catch (e) {
      log(e.toString(), name: "registrar");
      rethrow;
    }
  }

  Future<RegistroModel?> getCalificaion(int user) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('GET', Uri.parse('$baseUrl/Getlevel?id=$user'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final res = await response.stream.bytesToString();
        return RegistroModel.fromJson(res);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } on ClientException catch (e) {
      log(e.toString(), name: "calificar");

      // ignore: avoid_print
      print(json.encode(<String, dynamic>{
        'message': e.message,
        'uri': e.uri,
      }));
      return null;
    } catch (e) {
      log(e.toString(), name: "calificar");
      rethrow;
    }
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

  Future<bool> calificar(int user, List<QuestionsModel> respuestas) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse('$baseUrl/calificar?usuario=$user'));
      request.body = json.encode(respuestas.map((e) => e.toMap()).toList());
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 204) {
        return true;
      } else {
        // print(response.statusMessage);
        return false;
      }
    } on ClientException catch (e) {
      log(e.toString(), name: "calificar");

      // ignore: avoid_print
      print(json.encode(<String, dynamic>{'message': e.message, 'uri': e.uri}));
      return false;
    } catch (e) {
      log(e.toString(), name: "calificar");
      rethrow;
    }
  }
}

class Preguntas {
  final String baseUrl;
  Preguntas({required this.baseUrl});

  Future<List<QuestionsModel>?> getPreguntas() async {
    try {
      final dio = Dio();
      final response = await dio.get('$baseUrl');
      final questions = (response.data as List<dynamic>)
          .map((e) => QuestionsModel.fromMap(e as Map<String, dynamic>))
          .toList();

      return questions;
    } catch (e) {
      log(e.toString(), name: "getquestions");
    }
    return null;
  }

  Future<bool> eliminarPregunta(int id) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('DELETE', Uri.parse('$baseUrl/elimar?id=$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.toString(), name: "Eliminar Pregunta");

      // ignore: avoid_print
      print(json.encode(<String, dynamic>{
        'message': e.message,
        'uri': e.requestOptions.uri.toString(),
        'statusCode': e.response?.statusCode,
        'statusMessage': e.response?.statusMessage,
        'data': e.requestOptions.data,
        'error': e.response?.data
      }));
      return false;
    } catch (e) {
      log(e.toString(), name: "Eliminar Pregunta");
      rethrow;
    }
  }

  Future<bool> editarPregunta(int pregunta, QuestionsModel question) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('PUT', Uri.parse('$baseUrl/editar?pregunta=$pregunta'));
      request.body = json.encode(question.toMap());
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 204) {
        return true;
      } else {
        // print(response.statusMessage);
        return false;
      }
    } on ClientException catch (e) {
      log(e.toString(), name: "Editar Pregunta");

      // ignore: avoid_print
      print(json.encode(<String, dynamic>{'message': e.message, 'uri': e.uri}));
      return false;
    } catch (e) {
      log(e.toString(), name: "Editar Pregunta");
      rethrow;
    }
  }

  Future<bool> crearPregunta(QuestionsModel question) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse('$baseUrl/crear'));
      request.body = json.encode(question.toMap());
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        // print(response.statusMessage);
        return false;
      }
    } on ClientException catch (e) {
      log(e.toString(), name: "Editar Pregunta");

      // ignore: avoid_print
      print(json.encode(<String, dynamic>{'message': e.message, 'uri': e.uri}));
      return false;
    } catch (e) {
      log(e.toString(), name: "Editar Pregunta");
      rethrow;
    }
  }
}

class Panel {
  final String baseUrl;
  Panel({
    required this.baseUrl,
  });

  Future<List<RegistroModel>?> getPanel() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('GET', Uri.parse('$baseUrl/getPanel'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final jsonData = await response.stream.bytesToString();
        final data = json.decode(jsonData) as List<dynamic>;

        final res = data.map((e) => RegistroModel.fromMap(e)).toList();

        return res;
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString(), name: "calificar");

      // ignore: avoid_print
      print(json.encode(<String, dynamic>{
        'message': e.message,
        'uri': e.requestOptions.uri.toString(),
        'statusCode': e.response?.statusCode,
        'statusMessage': e.response?.statusMessage,
        'data': e.requestOptions.data,
        'error': e.response?.data
      }));
      return null;
    } catch (e) {
      log(e.toString(), name: "calificar");
      rethrow;
    }
  }

  Future<bool> eliminarRegistro(int id) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('DELETE', Uri.parse('$baseUrl/elimar?id=$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.toString(), name: "calificar");

      // ignore: avoid_print
      print(json.encode(<String, dynamic>{
        'message': e.message,
        'uri': e.requestOptions.uri.toString(),
        'statusCode': e.response?.statusCode,
        'statusMessage': e.response?.statusMessage,
        'data': e.requestOptions.data,
        'error': e.response?.data
      }));
      return false;
    } catch (e) {
      log(e.toString(), name: "calificar");
      rethrow;
    }
  }
}

class DioError extends DioException {
  DioError({required super.requestOptions});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': super.message,
      'uri': super.requestOptions.uri.toString(),
      'statusCode': super.response?.statusCode,
      'statusMessage': super.response?.statusMessage,
      'data': super.requestOptions.data
    };
  }

  String toJson() => json.encode(<String, dynamic>{
        'message': super.message,
        'uri': super.requestOptions.uri.toString(),
        'statusCode': super.response?.statusCode,
        'statusMessage': super.response?.statusMessage,
        'data': super.requestOptions.data
      });
}
