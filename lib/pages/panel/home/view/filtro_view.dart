// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/registro_model.dart';
import 'package:flutter_ingles_devs/repository/services/generar_excel.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:provider/provider.dart';
import 'package:tdtxle_data_format/extenciones/date_time_extents.dart';

class FiltroView extends StatefulWidget {
  final void Function(String) buscar;
  FiltroView({
    super.key,
    required this.buscar,
  });

  @override
  State<FiltroView> createState() => _FiltroViewState();
}

class _FiltroViewState extends State<FiltroView> {
  final textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (![0, 1].contains(sizeScreen.index))
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              backgroundColor: const Color.fromARGB(255, 49, 110, 51),
              foregroundColor: Colors.white,
            ),
            onPressed: crearExcel,
            child: const Text("Exportar registro a Excel"),
          ),
        const Spacer(),
        Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: TextField(
            controller: textControl,
            onChanged: widget.buscar,
            decoration: textFieldDecoration("Buscar"),
          ),
        ),
      ],
    );
  }

  InputDecoration textFieldDecoration(String name) {
    return InputDecoration(
      // labelText: name,
      hintText: name,
      filled: true,
      fillColor: const Color.fromRGBO(255, 255, 255, 1),
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(0, 31, 94, 1),
        ),
      ),
      suffixIcon: IconButton(
        onPressed: () {
          textControl.text = "";
          widget.buscar("");
        },
        icon: const Icon(Icons.clear),
      ),
    );
  }

  void crearExcel() {
    try {
      final registros = context.read<List<RegistroModel>?>();

      final excel = GenerarExcel("Registro-${DateTime.now().format("d-m-y")}");

      final List<List<CellValue>> rows = registros
              ?.map(
                (e) => [
                  e.id == null
                      ? const TextCellValue("")
                      : TextCellValue(e.id!.toString()),
                  TextCellValue(e.nombreCompleto),
                  TextCellValue(e.telefono),
                  TextCellValue(e.email),
                  e.score == null
                      ? const TextCellValue("")
                      : TextCellValue(e.score!.toString()),
                  e.correctaAnswers == null
                      ? const TextCellValue("")
                      : TextCellValue(e.correctaAnswers!.toString()),
                  TextCellValue(e.level ?? ""),
                ],
              )
              .toList() ??
          [];

      rows.insert(
          0,
          [
            const TextCellValue("#"),
            const TextCellValue("Nombre"),
            const TextCellValue("Teléfono"),
            const TextCellValue("Correo"),
            const TextCellValue("Puntaje"),
            const TextCellValue("Aciertos"),
            const TextCellValue("Nivel"),
            const TextCellValue("Fecha"),
          ].toList());

      excel.crearHoja("Cursos", rows);

      excel.guardar();
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al generar el exel\n${e.toString()}")));
    }
  }
}
