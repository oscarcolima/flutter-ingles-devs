import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PrincipalLayout(
      body: Padding(
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: LinearProgressIndicator(
                value: .5,
                color: Color.fromRGBO(13, 110, 253, 1),
                minHeight: 18,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffEB8D00),
                
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Siguiente",
                  style: GoogleFonts.getFont(
                    'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
