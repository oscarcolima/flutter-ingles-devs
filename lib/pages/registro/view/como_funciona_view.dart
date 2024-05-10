import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComoFuncionaView extends StatelessWidget {
  const ComoFuncionaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 486,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "¿Cómo funciona el test de nivel de inglés?",
                  style: GoogleFonts.getFont('Poppins',
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff3EB1C8)),
                ),
                const SizedBox(height: 60),
                Text(
                  "Nuestro test de inglés básico, incluye 25 preguntas. \n\n¡La prueba es rápida y 100% online! Conocerás tu resultado al instante en la misma página.",
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff001F5E)),
                  onPressed: () {},
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
          Image.asset('assets/imgs/image 17.png'),
        ],
      ),
    );
  }
}
