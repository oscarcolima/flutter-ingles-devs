// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveAppWidget extends StatefulWidget {
  final Widget child;
  const ResponsiveAppWidget({super.key, required this.child});

  @override
  State<ResponsiveAppWidget> createState() => _ResponsiveAppWidgetState();
}

class _ResponsiveAppWidgetState extends State<ResponsiveAppWidget> {
  late ResponsiveApp _responsive;
  @override
  Widget build(BuildContext context) {
// Utiliza MediaQuery para obtener información sobre la pantalla y la orientación del dispositivo
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Size screenSize = mediaQueryData.size;
    double screenWidth = screenSize.width;
    Orientation orientation = mediaQueryData.orientation;

    _responsive = ResponsiveApp(size: screenWidth, orientation: orientation);

    return ProxyProvider0<ResponsiveApp>(
      update: (context, value) => _responsive,
      builder: (context, child) => widget.child,
    );
  }
}

enum SizeScreen { xs, sm, md, lg, xl }

class ResponsiveApp {
  final double size;
  final Orientation orientation;
  ResponsiveApp({
    required this.size,
    required this.orientation,
  });

  SizeScreen get sizeScreen {
    late SizeScreen aux;
    if (size <= 576) {
      aux = SizeScreen.xs;
    } else if (size <= 767) {
      aux = SizeScreen.sm;
    } else if (size <= 991) {
      aux = SizeScreen.md;
    } else if (size <= 1199) {
      aux = SizeScreen.lg;
    } else {
      aux = SizeScreen.xl;
    }

    return aux;
  }
}
