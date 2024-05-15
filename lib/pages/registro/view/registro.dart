import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/registro.dart';

class RegistroView extends StatelessWidget {
  const RegistroView({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    return Container(
      color: const Color.fromRGBO(68, 224, 255, 0.2),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: [0, 1, 2].contains(sizeScreen.index)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Texto()),
                const Center(child: Registro())
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Center(
                    child: Texto(),
                  ),
                ),
                const Expanded(
                    child: Center(
                  child: Registro(),
                ))
              ],
            ),
    );
  }

  Card registro() {
    final tituloStyle = GoogleFonts.getFont(
      'Poppins',
      color: const Color.fromRGBO(0, 31, 94, 1),
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );

    List<String> listaDeOpciones = ["A", "B", "C", "D", "E", "F", "G"];

    return Card(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Descubre tu nivel de Inglés",
              style: tituloStyle,
            ),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                labelText: 'Filled',
                hintText: 'hint text',
                helperText: 'supporting text',
                filled: true,
              ),
            ),
            DropdownButtonFormField(
              items: listaDeOpciones.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      e,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {},
              isDense: true,
              isExpanded: true,
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container Texto() {
    final tituloStyle = GoogleFonts.getFont(
      'Poppins',
      color: const Color.fromRGBO(0, 31, 94, 1),
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
      constraints: const BoxConstraints(maxWidth: 405),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svgs/undraw_around_the_world_re_rb1p 1.svg',
            width: 250,
          ),
          const SizedBox(
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
