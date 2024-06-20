// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ingles_devs/data/model/answers_model.dart';

import 'package:flutter_ingles_devs/data/model/questions_model.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CrearPreguntaView extends StatefulWidget {
  const CrearPreguntaView({super.key});

  @override
  State<CrearPreguntaView> createState() => _EditarPreguntaViewState();
}

class _EditarPreguntaViewState extends State<CrearPreguntaView> {
  final _keyForm = GlobalKey<FormState>();

  late QuestionsModel pregunta;

  final focus = List.generate(8, (index) => FocusNode());
  @override
  void initState() {
    final fecha = DateTime.now();
    pregunta = QuestionsModel(
      id: 0,
      question: "",
      type: "complete",
      rightScore: 0,
      wrongScore: 0,
      eliminado: false,
      createat: fecha,
      updateat: fecha,
      answers: [
        AnswersModel(
          id: 0,
          answer: "",
          question: 0,
          iscorrect: false,
          createat: DateTime.now(),
          updateat: DateTime.now(),
        ),
        AnswersModel(
          id: 0,
          answer: "",
          question: 0,
          iscorrect: false,
          createat: DateTime.now(),
          updateat: DateTime.now(),
        ),
        AnswersModel(
          id: 0,
          answer: "",
          question: 0,
          iscorrect: false,
          createat: DateTime.now(),
          updateat: DateTime.now(),
        ),
        AnswersModel(
          id: 0,
          answer: "",
          question: 0,
          iscorrect: false,
          createat: DateTime.now(),
          updateat: DateTime.now(),
        ),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: AlertDialog(
        title: TextFormField(
          autofocus: true,
          focusNode: focus[0],
          initialValue: pregunta.question,
          onSaved: (newValue) => pregunta.question = newValue!,
          validator: (value) => (value ?? "").isEmpty
              ? "El campo no tiene que estar vació"
              : null,
          maxLines: 3,
          minLines: 1,
          onEditingComplete: () => focus[1].requestFocus(),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text("correcta"), border: OutlineInputBorder()),
                    initialValue: pregunta.rightScore.toString(),
                    focusNode: focus[1],
                    onEditingComplete: () => focus[2].requestFocus(),
                    onSaved: (newValue) =>
                        pregunta.rightScore = int.tryParse(newValue ?? "") ?? 0,
                    validator: (value) {
                      if ((value ?? "").isEmpty) {
                        return "El campo no tiene que estar vació";
                      }

                      if ((int.tryParse(value!) ?? 0) <= 0) {
                        return "El valor debe ser mayor a cero";
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text("incorrecta"),
                        border: OutlineInputBorder(gapPadding: 5)),
                    initialValue: pregunta.wrongScore.toString(),
                    focusNode: focus[2],
                    onEditingComplete: () => focus[3].requestFocus(),
                    onSaved: (newValue) =>
                        pregunta.wrongScore = int.tryParse(newValue ?? "") ?? 0,
                    validator: (value) {
                      if ((value ?? "").isEmpty) {
                        return "El campo no tiene que estar vació";
                      }

                      if ((int.tryParse(value!) ?? 0) <= 0) {
                        return "El valor debe ser mayor a cero";
                      }

                      return null;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(width: 300, height: 20),
            ...generarPreguntas(),
            if (!selectRespuesta)
              Text(
                "Seleccione cual sera la respuesta correcta",
                style: GoogleFonts.getFont(
                  'Open Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              "Cancelar",
              style: GoogleFonts.getFont(
                'Open Sans',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xff0D6EFD),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_keyForm.currentState!.validate() && validarSeleeccion()) {
                _keyForm.currentState!.save();

                IngesDevApi.pregunta().crearPregunta(pregunta);
                print(json.encode(pregunta.toMap()));
                context.pop(pregunta);
              }
            },
            child: Text(
              "Listo",
              style: GoogleFonts.getFont(
                'Open Sans',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xff0D6EFD),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> generarPreguntas() {
    List<Widget> respuestas = [];

    for (var i = 0; i < pregunta.answers!.length; i++) {
      final respuesta = pregunta.answers![i];
      respuestas.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListTile(
          leading: (!respuesta.iscorrect)
              ? IconButton(
                  onPressed: () => seleccionarRespuesta(i),
                  icon: const Icon(Icons.circle_outlined))
              : const Icon(Icons.check_circle_outlined,
                  color: Color(0xff0D6EFD)),
          title: TextFormField(
            initialValue: respuesta.answer,
            focusNode: focus[i + 3],
            onEditingComplete: () => focus[i + 4].requestFocus(),
            style: GoogleFonts.getFont(
              'Open Sans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: (!respuesta.iscorrect) ? null : const Color(0xff0D6EFD),
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            onSaved: (newValue) => pregunta.answers![i].answer = newValue!,
            validator: (value) => (value ?? "").isEmpty
                ? "El campo no tiene que estar vació"
                : null,
          ),
          shape: Border.all(
            color:
                (!respuesta.iscorrect) ? Colors.grey : const Color(0xff0D6EFD),
          ),
        ),
      ));
    }

    return respuestas;
  }

  void seleccionarRespuesta(int idenx) {
    for (var pregunta in pregunta.answers!) {
      pregunta.iscorrect = false;
    }

    pregunta.answers![idenx].iscorrect = true;

    setState(() {});
  }

  bool selectRespuesta = true;
  bool validarSeleeccion() {
    selectRespuesta = false;

    for (var element in pregunta.answers!) {
      if (element.iscorrect) {
        selectRespuesta = true;
        break;
      }
    }
    setState(() {});
    return selectRespuesta;
  }
}
