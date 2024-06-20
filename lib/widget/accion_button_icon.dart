// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AccionButtonIcon extends StatefulWidget {
  final ButtonStyle? style;
  final IconData icon;
  final Future<void> Function()? onPressed;
  final Color? colorCircularProgress;

  const AccionButtonIcon({
    super.key,
    this.style,
    required this.icon,
    this.onPressed,
    this.colorCircularProgress,
  });

  @override
  State<AccionButtonIcon> createState() => _AccionButtonState();
}

class _AccionButtonState extends State<AccionButtonIcon> {
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
          : Icon(widget.icon),
    );
  }
}
