import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreguntaWidget extends StatefulWidget {
  final int index;
  final String pregunta;
  final List<String> respuestas;
  final void Function(int res) res;
  const PreguntaWidget(
      {super.key,
      required this.index,
      required this.pregunta,
      required this.respuestas,
      required this.res});

  @override
  State<PreguntaWidget> createState() => _PreguntaWidgetState();
}

class _PreguntaWidgetState extends State<PreguntaWidget> {
  int? select;
  late String pregunta;
  late List<String> respuestas;

  @override
  void initState() {
    pregunta = widget.pregunta;
    respuestas = widget.respuestas;
    super.initState();
  }

  @override
  void didUpdateWidget(PreguntaWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pregunta != oldWidget.pregunta ||
        widget.respuestas != oldWidget.respuestas) {
      // Actualiza las preguntas y respuestas si son diferentes
      pregunta = widget.pregunta;
      respuestas = widget.respuestas;
      select = null; // Reinicia la selección
      setState(() {}); // Fuerza la actualización
    }
  }

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
      for (int i = 0; i < respuestas.length; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              widget.res(i);
              setState(() {
                select = i;
              });
            },
            child: ListTile(
              leading: (i != select)
                  ? const Icon(Icons.circle_outlined)
                  : const Icon(Icons.check_circle_outlined,
                      color: Color.fromARGB(255, 253, 69, 13)),
              title: Text(
                respuestas[i],
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
      crossAxisAlignment: CrossAxisAlignment
          .start, // Asegura alineación vertical si el texto es largo
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
        // Ajustamos el widget Text
        Expanded(
          child: Text(
            pregunta,
            style: GoogleFonts.getFont(
              'Open Sans',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            softWrap: true, // Permite que el texto se envuelva
            overflow:
                TextOverflow.visible, // Alternativa: usar ellipsis para truncar
          ),
        ),
      ],
    );
  }
}
