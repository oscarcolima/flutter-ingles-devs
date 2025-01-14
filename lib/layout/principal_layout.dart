// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:provider/provider.dart';

class PrincipalLayout extends StatelessWidget {
  final Widget body;
  const PrincipalLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        foregroundColor: Color.fromRGBO(255, 255, 255, 1),
        surfaceTintColor: Color.fromRGBO(255, 255, 255, 1),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Padding(
          padding: EdgeInsets.only(
            left: sizeScreen.index <= 2
                ? 1
                : 156, // Ajuste dinámico para pantallas pequeñas
          ),
          child: Image.asset(
            'assets/imgs/INGLES-PARA-DEVS_logo.png',
            width: 100,
          ),
        ),
      ),
      body: body,
    );
  }
}
