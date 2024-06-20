// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_ingles_devs/data/model/questions_model.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditarPreguntaView extends StatefulWidget {
  final QuestionsModel pregunta;
  const EditarPreguntaView({
    Key? key,
    required this.pregunta,
  }) : super(key: key);

  @override
  State<EditarPreguntaView> createState() => _EditarPreguntaViewState();
}

class _EditarPreguntaViewState extends State<EditarPreguntaView> {
  final _keyForm = GlobalKey<FormState>();

  late QuestionsModel pregunta;

  @override
  void initState() {
    pregunta = widget.pregunta;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: AlertDialog(
        title: TextFormField(
          initialValue: pregunta.question,
          onSaved: (newValue) => pregunta.question = newValue!,
          maxLines: 3,
          minLines: 1,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("correcta"),border: OutlineInputBorder()),
                    initialValue: pregunta.rightScore.toString(),
                    onSaved: (newValue) =>
                        pregunta.rightScore = int.tryParse(newValue ?? "") ?? 0,
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("incorrecta"),border: OutlineInputBorder(gapPadding: 5)),
                    initialValue: pregunta.wrongScore.toString(),
                    onSaved: (newValue) =>
                        pregunta.wrongScore = int.tryParse(newValue ?? "") ?? 0,
                  ),
                )
              ],
            ),
            const SizedBox(width: 300,height: 20),
            ...generarPreguntas(),
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
              _keyForm.currentState!.save();

              IngesDevApi.pregunta().editarPregunta(pregunta.id, pregunta);
              print(json.encode(pregunta.toMap()));
              context.pop(pregunta);
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
            style: GoogleFonts.getFont(
              'Open Sans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: (!respuesta.iscorrect) ? null : const Color(0xff0D6EFD),
            ),
            decoration: const InputDecoration(border: InputBorder.none),
            onSaved: (newValue) => pregunta.answers![i].answer = newValue!,
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
}
