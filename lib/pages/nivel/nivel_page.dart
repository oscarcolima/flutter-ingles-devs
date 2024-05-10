// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class NivelPage extends StatefulWidget {
  const NivelPage({super.key});

  @override
  State<NivelPage> createState() => _NivelPageState();
}

class _NivelPageState extends State<NivelPage> {

late RegistroModel user;

@override
  void initState() {
     final box = Hive.box("registro");
     user = RegistroModel.fromMap(
        box.toMap().map<String, dynamic>((key, value) => MapEntry(key, value)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PrincipalLayout(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 672,
                child: Card(
                  // shape: Border.all(style: ),
                  color: const Color(0xffF8F9F9),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/svgs/Vector.svg'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "¡Felicidades por haber completado el test!",
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff001F5E)),
                          ),
                        ),
                        Text(
                          "Has respondido correctamente a ${user.correctanswers} de 25 preguntas.",
                          style: GoogleFonts.getFont(
                            'IBM Plex Sans',
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                          margin: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xffEB8D00)),
                              borderRadius: BorderRadius.circular(100)),
                          child: Text(
                            user.level!,
                            style: GoogleFonts.getFont('Poppins',
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffEB8D00)),
                          ),
                        ),
                        Text(
                          "Nivel de acuerdo al Marco Común Europeo",
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(),
                        ),
                        Text(
                          "¿Quieres aprender inglés en serio?",
                          style: GoogleFonts.getFont('Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff001F5E)),
                        ),
                        Text(
                          "Únete a nuestra comunidad en Discord, recibe semanalmente consejos de estudio de algunos de los profesores de inglés más populares de Internet.",
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 380,
                height: 721,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
