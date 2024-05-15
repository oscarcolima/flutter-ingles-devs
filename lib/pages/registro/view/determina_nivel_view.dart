import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/registro_page_provaider.dart';

class DeterminaNivelView extends StatelessWidget {
  DeterminaNivelView({super.key});

  final _niveles = [
    {
      'nivel': "A1",
      'nivel2': "Principiante",
      'detalles': "Estás empezando a aprender tus primeras palabras."
    },
    {
      'nivel': "A2",
      'nivel2': "Básico",
      'detalles': "Puedes comprender y utilizar expresiones y frases básicas."
    },
    {
      'nivel': "B1",
      'nivel2': "Pre-Intermedio",
      'detalles':
          "Puedes comunicarte de forma sencilla y realizar tareas rutinarias."
    },
    {
      'nivel': "B2",
      'nivel2': "Intermedio",
      'detalles':
          "Puedes comprender y usar oraciones sobre temas familiares o de interés personal."
    },
    {
      'nivel': "C1",
      'nivel2': "Intermedio",
      'detalles':
          "Puedes comprender y usar oraciones sobre temas familiares o de interés personal."
    },
    {
      'nivel': "C2",
      'nivel2': "Avanzado",
      'detalles':
          "Puedes comprender y usar oraciones sobre temas familiares o de interés personal."
    },
  ];
  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    log("sizeScreen: ${sizeScreen}");

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: [0, 1, 2].contains(sizeScreen.index) ? 50 : 216,
        vertical: 50,
      ),
      child: Column(
        children: [
          Text(
            "¿Cómo determina la prueba tu nivel de inglés?",
            style: GoogleFonts.getFont('Poppins',
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: const Color(0xff001F5E)),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: GridView.builder(
              itemCount: _niveles.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 50,
                mainAxisSpacing: 30,
                crossAxisCount: 3,
                childAspectRatio: 1.7,
              ),
              itemBuilder: (context, index) => Card(
                color: const Color(0xffFCF5E1),
                surfaceTintColor: const Color(0xffFCF5E1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2.5),
                      child: Text(
                        _niveles[index]["nivel"] ?? "",
                        style: GoogleFonts.getFont('Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff001F5E)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2.5),
                      child: Text(
                        _niveles[index]["nivel2"] ?? "",
                        style: GoogleFonts.getFont('Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff001F5E)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2.5),
                      child: Text(
                        _niveles[index]["detalles"] ?? "",
                        style: GoogleFonts.getFont('Poppins',
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Card(
            color: const Color(0xffD8EFF4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      "¡Test de nivel de inglés GRATIS!",
                      maxLines: 4,
                      style: GoogleFonts.getFont('Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff001F5E)),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff001F5E)),
                    onPressed: () {
                      context.read<RegistroPageProvaider>().gotToForm();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Text(
                        "Empezar test",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: [0,1].contains(sizeScreen.index) ? 14 : 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
