import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/questions_model.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:flutter_ingles_devs/pages/test/widgets/pregunta_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();

    getQuestions();
  }

  List<QuestionsModel>? questions;
  void getQuestions() async {
    final dio = Dio();
    final response =
        await dio.get('http://localhost:5015/api/Test/getquestions');

    questions = (response.data as List<dynamic>)
        .map((e) => QuestionsModel.fromMap(e as Map<String, dynamic>))
        .toList();
    setState(() {});
  }

  int nivel = 1, start = 0, terminar = 0;
  void gnenrarLista() {
    start = terminar;
    int aumnet = nivel * 5;
    terminar =
        (aumnet < (questions?.length ?? 0)) ? aumnet : questions?.length ?? 0;
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    gnenrarLista();

    return PrincipalLayout(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 254),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pon a prueba tu Inglés",
                style: GoogleFonts.getFont('Poppins',
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(27, 54, 93, 1)),
              ),
              Text(
                "Obtén una estimación extraoficial de tu resultado",
                style: GoogleFonts.getFont(
                  'IBM Plex Sans',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
              Text(
                "Para las preguntas siguientes, elije la mejor opción para completar la oración.",
                style: GoogleFonts.getFont(
                  'Open Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: LinearProgressIndicator(
                  value: start / (questions?.length ?? 1),
                  color: const Color.fromRGBO(13, 110, 253, 1),
                  minHeight: 18,
                ),
              ),
              if (questions == null) const Text("Cargando Preguntas"),
              if (questions != null)
                ...questions!.sublist(start, terminar).map(
                      (val) => PreguntaWidget(
                        index: val.id,
                        pregunta: val.question,
                        respuestas: const ["Were", "Where", "How", "Was"],
                      ),
                    ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffEB8D00),
                ),
                onPressed: () {
                  if (terminar == (questions?.length ?? -1)) {
                    context.replace(Uri(path: '/thank/pako').toString());
                  } else {
                    setState(() {
                      nivel += 1;
                    });
                    _scrollController.jumpTo(0);
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Siguiente",
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
