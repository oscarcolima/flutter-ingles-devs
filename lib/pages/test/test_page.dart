import 'package:flutter/material.dart';
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
  List<int> lista = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27
  ];

  int nivel = 1, start = 0, terminar = 0;
  void gnenrarLista() {
    start = terminar;
    int aumnet = nivel * 5;
    terminar = (aumnet < lista.length) ? aumnet : lista.length;
  }

  ScrollController _scrollController = ScrollController();

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
                  value: start / lista.length,
                  color: const Color.fromRGBO(13, 110, 253, 1),
                  minHeight: 18,
                ),
              ),
              ...lista.sublist(start, terminar).map(
                    (index) => PreguntaWidget(
                      index: index,
                      pregunta: "_____ you a good student in college?",
                      respuestas: const ["Were", "Where", "How", "Was"],
                    ),
                  ),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffEB8D00),
                ),
                onPressed: () {
                  if (terminar == lista.length) {
                    context.replace(Uri(path: '/thank/pako').toString());
                  }else{

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
