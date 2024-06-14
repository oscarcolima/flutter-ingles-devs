// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            backgroundColor: const Color.fromARGB(255, 49, 110, 51),
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
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
}
