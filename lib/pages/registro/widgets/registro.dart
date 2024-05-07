import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/Tecnologias_model.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdtx_nf_icons/tdtx_nf_icons.dart';
import 'package:tdtxle_data_format/formatter/number_formatter.dart';
import 'package:tdtxle_data_format/formatter/phone_input_formatter.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tituloStyle = GoogleFonts.getFont(
      'Poppins',
      color: const Color.fromRGBO(0, 31, 94, 1),
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );

    final inputStyle = GoogleFonts.getFont(
      'IBM Plex Sans',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    List<Catalogos> listaDeOpciones = [
      Catalogos(value: "A", texto: "A"),
      Catalogos(value: "B", texto: "B"),
      Catalogos(value: "C", texto: "C"),
      Catalogos(value: "D", texto: "D"),
      Catalogos(value: "E", texto: "E"),
      Catalogos(value: "F", texto: "F"),
      Catalogos(value: "G", texto: "G"),
    ];

    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Card(
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Descubre tu nivel de Inglés",
                style: tituloStyle,
              ),
              const SizedBox(height: 35),
              TextField(
                style: inputStyle,
                decoration: textFieldDecoration("nombre Completo"),
              ),
              const SizedBox(height: 20),
              TextField(
                style: inputStyle,
                decoration: textFieldDecoration("Correo electrónico"),
              ),
              const SizedBox(height: 20),
              TextField(
                style: inputStyle,
                decoration: textFieldDecoration("¿Cuál es tu profesión?"),
              ),
              const SizedBox(height: 20),
              TextField(
                style: inputStyle,
                inputFormatters: [PhoneInputFormatter()],
                decoration: textFieldDecoration("Telefono"),
              ),
              const SizedBox(height: 20),
              TextField(
                style: inputStyle,
                inputFormatters: [NumberFormatter()],
                decoration:
                    textFieldDecoration("¿Cuántos años de experiencia tienes?"),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                items: generarLista(listaDeOpciones),
                onChanged: (value) {},
                isDense: true,
                isExpanded: true,
                decoration: textFieldDecoration(
                    "¿Con qué tecnología trabajas principalmente?"),
              ),
              const SizedBox(height: 20),
              FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 31, 94, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8)),
                onPressed: () {
                  context.go('/test');
                },
                child: const Text("Empezar test"),
              ),
              const SizedBox(height: 20),
              Text(
                "Al hacer clic en “Comenzar”acepto el uso de mis datos personales de acuerdo con la Política de Privacidad y recibir las últimas noticias, ofertas e información sobre lInglés para Devs por email.",
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration(String name) {
    return InputDecoration(
      labelText: name,
      hintText: name,
      filled: true,
      fillColor: const Color.fromRGBO(255, 255, 255, 1),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(0, 31, 94, 1),
        ),
      ),
    );
  }

  generarLista(List<Catalogos> lista) {
    return lista.map((e) {
      return DropdownMenuItem(
        value: e.value,
        child: SizedBox(
          width: double.infinity,
          child: ListTile(
            title: Text(e.texto),
            leading: Icon(TDTxNFIcons.nf_dev_python),
          ),
        ),
      );
    }).toList();
  }
}
