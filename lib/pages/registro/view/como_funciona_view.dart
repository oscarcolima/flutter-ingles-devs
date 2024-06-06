import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/registro_page_provaider.dart';

class ComoFuncionaView extends StatelessWidget {
  const ComoFuncionaView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);
    final size =
        context.select<ResponsiveApp, double>((ResponsiveApp p) => p.size);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: [0, 1, 2].contains(sizeScreen.index) ? 10 : 20,
        vertical: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: [0, 1, 2].contains(sizeScreen.index) ? size-20 : 486),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "¿Cómo funciona el test de nivel de inglés?",
                  style: GoogleFonts.getFont('Poppins',
                      fontSize: [0, 1, 2].contains(sizeScreen.index) ? 32 : 36,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff3EB1C8)),
                ),
                [0, 1, 2].contains(sizeScreen.index)
                    ? Image.asset(
                        'assets/imgs/image 17.png',
                      )
                    : const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Nuestro test de inglés básico, incluye 25 preguntas. \n\n¡La prueba es rápida y 100% online! Conocerás tu resultado al instante en la misma página.",
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: [0].contains(sizeScreen.index) ? 16 : 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff001F5E)),
                  onPressed: () {
                    context.read<RegistroPageProvaider>().gotToForm();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Text(
                      "Empezar test",
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (![0, 1, 2].contains(sizeScreen.index))
            Image.asset('assets/imgs/image 17.png'),
        ],
      ),
    );
  }
}
