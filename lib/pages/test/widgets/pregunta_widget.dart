import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreguntaWidget extends StatefulWidget {
  final int index;
  final String pregunta;
  final List<String> respuestas;
  const PreguntaWidget(
      {super.key,
      required this.index,
      required this.pregunta,
      required this.respuestas});

  @override
  State<PreguntaWidget> createState() => _PreguntaWidgetState();
}

class _PreguntaWidgetState extends State<PreguntaWidget> {
  int? select;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 30),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff3EB1C8),
          ),
        ),
      ),
      child: Column(
        children: [
          generarPegunta(),
          ...generarPregunta(),
        ],
      ),
    );
  }

  List<Widget> generarPregunta() {
    return {
      for (int i = 0; i < widget.respuestas.length; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                select = i;
              });
            },
            child: ListTile(
              leading: (i != select)
                  ? const Icon(Icons.circle_outlined)
                  : const Icon(Icons.check_circle_outlined,
                      color: Color(0xff0D6EFD)),
              title: Text(
                widget.respuestas[i],
                style: GoogleFonts.getFont(
                  'Open Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: (i != select) ? null : const Color(0xff0D6EFD),
                ),
              ),
              shape: Border.all(
                color: (i != select) ? Colors.grey : const Color(0xff0D6EFD),
              ),
              hoverColor: Colors.red,
            ),
          ),
        )
    }.toList();
  }

  Widget generarPegunta() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xff3EB1C8),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                child: Text(
                  widget.index.toString(),
                  style: GoogleFonts.getFont(
                    'Poppins',
                    color: const Color(0xff3EB1C8),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 25),
        Text(
          widget.pregunta,
          style: GoogleFonts.getFont(
            'Open Sans',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
