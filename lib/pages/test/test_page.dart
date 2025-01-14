import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/answers_model.dart';
import 'package:flutter_ingles_devs/data/model/questions_model.dart';
import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:flutter_ingles_devs/pages/test/widgets/pregunta_widget.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

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
  List<AnswersModel?> answers = [];

  void getQuestions() async {
    questions = await IngesDevApi.test().getquestions() ?? [];
    answers = List.generate(
      questions?.length ?? 0,
      (index) => null,
    );
    gnenrarLista();
    setState(() {});
  }

  int nivel = 1, start = 0, terminar = 0;
  void gnenrarLista() {
    showQuestion = [];
    start = terminar;
    int aumnet = nivel * 5;
    terminar =
        (aumnet < (questions?.length ?? 0)) ? aumnet : questions?.length ?? 0;

    final aux = questions!.sublist(start, terminar);

    for (var i = 1; i <= aux.length; i++) {
      final q = aux[i - 1];
      final a = q.answers?.map((e) => e.answer).toList() ?? [];
      showQuestion.add(PreguntaWidget(
        index: i + start,
        pregunta: q.question,
        respuestas: a,
        res: (res) {
          final index0 = i + start - 1;
          final respuesta = q.answers![res];
          answers[index0] = respuesta; // = [respuesta];
        },
      ));
    }
  }

  final ScrollController _scrollController = ScrollController();

  List<PreguntaWidget> showQuestion = [];

  @override
  Widget build(BuildContext context) {
    return ProxyProvider0(
      update: (_, __) => showQuestion,
      child: PrincipalLayout(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...header(),
                if (questions == null) const Text("Cargando Preguntas"),
                if (questions != null) ...showQuestion,
                const SizedBox(height: 50),
                if (!complet) ...[
                  const Text("Contesta todas las Preguntas"),
                  const SizedBox(height: 50),
                ],
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffEB8D00)),
                  onPressed: next,
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
      ),
    );
  }

  bool complet = true;
  void next() {
    complet = true;

    for (int i = start; i < terminar; i++) {
      if (answers[i] == null) {
        complet = false;
        break;
      }
    }

    if (complet) {
      if (terminar == (questions?.length ?? -1)) {
        sendRespuestas();
      } else {
        nivel += 1;
        gnenrarLista();
        _scrollController.jumpTo(0);
      }
    }

    setState(() {
      setState(() {
        // Este setState asegura que la página completa se reconstruya.
        showQuestion =
            List.from(showQuestion); // Fuerza la reconstrucción de widgets
      });
    });
  }

  List<Widget> header() {
    double screenWidth = MediaQuery.of(context).size.width;
    return [
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
    ];
  }

  void sendRespuestas() {
    final box = Hive.box("registro");
    final user = RegistroModel.fromMap(
        box.toMap().map<String, dynamic>((key, value) => MapEntry(key, value)));

    bool complet = true;

    for (var i = 0; i < (questions?.length ?? 0); i++) {
      questions?[i].answers = [answers[i]!];
    }

    if (complet) {
      IngesDevApi.test().calificar(user.id!, questions!).then((value) async {
        if (value) {
          final call = await IngesDevApi.registro().getCalificaion(user.id!);

          await box.putAll(call!.toMap());

          final pat = Uri(path: '/thank').toString();
          context.replace(pat);
        }
      });
    }
  }
}
