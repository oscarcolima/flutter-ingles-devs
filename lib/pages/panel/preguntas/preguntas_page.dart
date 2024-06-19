import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/questions_model.dart';
import 'package:flutter_ingles_devs/layout/panel_layout.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/tabla_view/tabla_model.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/tabla_view/tabla_view.dart';
import 'package:flutter_ingles_devs/pages/panel/preguntas/view/show_pregunta_view.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';

class PreguntasPage extends StatefulWidget {
  const PreguntasPage({super.key});

  @override
  State<PreguntasPage> createState() => _PreguntasPageState();
}

class _PreguntasPageState extends State<PreguntasPage> {
  late List<QuestionsModel> preguntas = [];
  @override
  void initState() {
    IngesDevApi.pregunta().getPreguntas().then((value) {
      preguntas = value ?? [];
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = preguntas
        .map(
          (e) => [
            CellBodyTable(data: e.id.toString()),
            CellBodyTable(data: e.question),
            CellBodyTable(
                data: e.answers!
                    .firstWhere((element) => element.iscorrect)
                    .answer),
            CellBodyTable(data: e.rightScore.toString()),
            CellBodyTable(data: e.wrongScore.toString()),
          ],
        )
        .toList();

    return PanelLayout(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: TablaView(
          headers: [
            HeaderTable(nombre: "#", orden: true, fixedWidth: 100),
            HeaderTable(nombre: "pregunta"),
            HeaderTable(nombre: "respuesta"),
            HeaderTable(nombre: "puntos correctos", fixedWidth: 150),
            HeaderTable(nombre: "puntos negativos", fixedWidth: 150),
          ],
          body: data,
          ver: (index) async {
            showDialog(
              context: context,
              builder: (context) => ShowPreguntaView(
                pregunta: preguntas[index],
              ),
            );
          },
          eliminar: (index) async {},
          editar: (index) async {},
        ),
      ),
    );
  }
}
