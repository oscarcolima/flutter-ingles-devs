// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ingles_devs/data/model/questions_model.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowPreguntaView extends StatelessWidget {
  final QuestionsModel pregunta;
  const ShowPreguntaView({
    Key? key,
    required this.pregunta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(pregunta.question),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: pregunta.answers!
            .map(
              (e) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListTile(
                  leading: (!e.iscorrect)
                      ? const Icon(Icons.circle_outlined)
                      : const Icon(Icons.check_circle_outlined,
                          color: Color(0xff0D6EFD)),
                  title: Text(
                    e.answer,
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: (!e.iscorrect) ? null : const Color(0xff0D6EFD),
                    ),
                  ),
                  shape: Border.all(
                    color:
                        (!e.iscorrect) ? Colors.grey : const Color(0xff0D6EFD),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            "Listo",
            style: GoogleFonts.getFont(
              'Open Sans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xff0D6EFD),
            ),
          ),
        )
      ],
    );
  }
}
