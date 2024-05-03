import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(68, 224, 255, 0.2),
      width: double.infinity,
      // height: 500,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Texto(),
            ),
          ),
          Expanded(
              child: Center(
            child: Card(
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Descubre tu nivel de Inglés"),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Container Texto() {
    final tituloStyle = GoogleFonts.getFont(
      'Poppins',
      color: Color.fromRGBO(0, 31, 94, 1),
      fontSize: 44,
      fontWeight: FontWeight.w700,
    );

    final listaStyle = GoogleFonts.getFont(
      'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    return Container(
      margin: const EdgeInsets.all(61),
      constraints: BoxConstraints(maxWidth: 405),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svgs/undraw_around_the_world_re_rb1p 1.svg',
            width: 250,
          ),
          SizedBox(
            height: 61,
          ),
          Text("¿Quieres saber tu nivel de inglés?", style: tituloStyle),
          ListTile(
            title: Text(
              "Completa el registro.",
              style: listaStyle,
            ),
            leading: const Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            title: Text(
              "Realiza el examen de nivel con tus conocimientos.",
              style: listaStyle,
            ),
            leading: const Icon(Icons.arrow_right_sharp),
          ),
          ListTile(
            title: Text(
              "Conoce tu nivel en línea.",
              style: listaStyle,
            ),
            leading: const Icon(Icons.arrow_right_sharp),
          )
        ],
      ),
    );
  }
}
