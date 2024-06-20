import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ingles_devs/data/model/questions_model.dart';
import 'package:flutter_ingles_devs/layout/panel_layout.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/tabla_view/tabla_model.dart';
import 'package:flutter_ingles_devs/pages/panel/home/view/tabla_view/tabla_view.dart';
import 'package:flutter_ingles_devs/pages/panel/preguntas/view/crear_pregunta_view%20copy.dart';
import 'package:flutter_ingles_devs/pages/panel/preguntas/view/show_pregunta_view.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'view/editar_pregunta_view.dart';

class PreguntasPage extends StatefulWidget {
  const PreguntasPage({super.key});

  @override
  State<PreguntasPage> createState() => _PreguntasPageState();
}

class _PreguntasPageState extends State<PreguntasPage> {
  late List<QuestionsModel> preguntas = [];
  bool loading = true;
  @override
  void initState() {
    IngesDevApi.pregunta().getPreguntas().then((value) {
      setState(() {
        preguntas = value ?? [];
        loading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    return PanelLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white),
                onPressed: crear,
                icon: const Icon(Icons.add),
                label: const Text("Crear Pregunta")),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: loading
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(
                            color: Color.fromRGBO(0, 31, 94, 1),
                          ),
                          Text(
                            "Cargando datos",
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: const Color.fromRGBO(0, 31, 94, 1),
                              fontSize:
                                  [0, 1].contains(sizeScreen.index) ? 16 : 24,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    )
                  : TablaView(
                      headers: headers(sizeScreen),
                      body: preguntas.map((e) => row(sizeScreen, e)).toList(),
                      ver: [0, 1].contains(sizeScreen.index) ? null : ver,
                      eliminar:
                          [0, 1].contains(sizeScreen.index) ? null : eliminar,
                      editar: [0, 1].contains(sizeScreen.index) ? null : editar,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  List<HeaderTable> headers(SizeScreen sizeScreen) {
    return switch (sizeScreen) {
      SizeScreen.xs => [
          HeaderTable(nombre: "#", numeric: true, orden: true, fixedWidth: 100),
          HeaderTable(nombre: "pregunta"),
          HeaderTable(nombre: "puntos correctos", fixedWidth: 150),
        ],
      SizeScreen.sm => [
          HeaderTable(nombre: "#", numeric: true, orden: true, fixedWidth: 100),
          HeaderTable(nombre: "pregunta"),
          HeaderTable(nombre: "puntos correctos", fixedWidth: 150),
        ],
      SizeScreen.md => [
          HeaderTable(nombre: "#", numeric: true, orden: true, fixedWidth: 100),
          HeaderTable(nombre: "pregunta"),
          HeaderTable(nombre: "puntos correctos", fixedWidth: 150),
        ],
      SizeScreen.lg => [
          HeaderTable(nombre: "#", numeric: true, orden: true, fixedWidth: 100),
          HeaderTable(nombre: "pregunta"),
          HeaderTable(nombre: "respuesta"),
          HeaderTable(nombre: "puntos correctos", fixedWidth: 150),
        ],
      _ => [
          HeaderTable(nombre: "#", numeric: true, orden: true, fixedWidth: 100),
          HeaderTable(nombre: "pregunta"),
          HeaderTable(nombre: "respuesta"),
          HeaderTable(nombre: "puntos correctos", fixedWidth: 150),
          HeaderTable(nombre: "puntos negativos", fixedWidth: 150),
        ]
    };
  }

  List<CellBodyTable> row(SizeScreen sizeScreen, QuestionsModel pregunta) {
    final respuesta =
        pregunta.answers!.firstWhere((element) => element.iscorrect).answer;
    return switch (sizeScreen) {
      SizeScreen.xs => [
          CellBodyTable(data: pregunta.id.toString()),
          CellBodyTable(data: pregunta.question),
          CellBodyTable(data: pregunta.rightScore.toString()),
        ],
      SizeScreen.sm => [
          CellBodyTable(data: pregunta.id.toString()),
          CellBodyTable(data: pregunta.question),
          CellBodyTable(data: pregunta.rightScore.toString()),
        ],
      SizeScreen.md => [
          CellBodyTable(data: pregunta.id.toString()),
          CellBodyTable(data: pregunta.question),
          CellBodyTable(data: pregunta.rightScore.toString()),
        ],
      SizeScreen.lg => [
          CellBodyTable(data: pregunta.id.toString()),
          CellBodyTable(data: pregunta.question),
          CellBodyTable(data: respuesta),
          CellBodyTable(data: pregunta.rightScore.toString()),
        ],
      _ => [
          CellBodyTable(data: pregunta.id.toString()),
          CellBodyTable(data: pregunta.question),
          CellBodyTable(data: respuesta),
          CellBodyTable(data: pregunta.rightScore.toString()),
          CellBodyTable(data: pregunta.wrongScore.toString()),
        ]
    };
  }

  Future<void> ver(int index) async {
    showDialog(
      context: context,
      builder: (context) => ShowPreguntaView(
        pregunta: preguntas[index],
      ),
    );
  }

  Future<void> eliminar(int index) async {
    final id = preguntas[index].id!;
    final preguntaApi = IngesDevApi.pregunta();
    final elimiaado = await preguntaApi.eliminarPregunta(id);
    if (elimiaado) {
      setState(() {
        preguntas.removeAt(index);
      });
    }
  }

  Future<void> editar(int index) async {
    final newquestion = await showDialog<QuestionsModel?>(
      context: context,
      builder: (context) => EditarPreguntaView(
        pregunta: preguntas[index],
      ),
    );

    if (newquestion != null) {
      setState(() {
        preguntas[index] = newquestion;
      });
    }
  }

  Future<void> crear() async {
    final newquestion = await showDialog<QuestionsModel?>(
      context: context,
      builder: (context) => const CrearPreguntaView(),
    );

    if (newquestion != null) {
      setState(() {
        preguntas.add(newquestion);
      });
    }
  }
}
