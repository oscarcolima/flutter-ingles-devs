// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AccionButton extends StatefulWidget {
  final ButtonStyle? style;
  final String text;
  final Future<void> Function()? onPressed;
  final Color? colorCircularProgress;

  const AccionButton({
    super.key,
    this.style,
    required this.text,
    this.onPressed,
    this.colorCircularProgress,
  });

  @override
  State<AccionButton> createState() => _AccionButtonState();
}

class _AccionButtonState extends State<AccionButton> {
  bool cargando = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.style,
      onPressed: () async {
        setState(() => cargando = true);

        await widget.onPressed?.call();

        setState(() => cargando = false);
      },
      child: cargando
          ? CircularProgressIndicator(color: widget.colorCircularProgress)
          : Text(widget.text),
    );
  }
}
