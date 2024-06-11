// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:provider/provider.dart';

class PanelLayout extends StatelessWidget {
  final Widget body;
  const PanelLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        endDrawer: [0, 1, 2].contains(sizeScreen.index) ? drawer() : null,
        appBar:
            [0, 1, 2].contains(sizeScreen.index) ? appbar(sizeScreen) : null,
        body: Stack(
          children: [
            if (![0, 1, 2].contains(sizeScreen.index))
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                child: drawer(),
              ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: [0, 1, 2].contains(sizeScreen.index) ? 0 : 304,
              child: body,
            ),
          ],
        )

        /* Row(
        children: [
          
          body,
        ],
      ), */
        );
  }

  AppBar appbar(SizeScreen sizeScreen) {
    return AppBar(
      elevation: 2,
      // foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      surfaceTintColor: Color.fromRGBO(255, 255, 255, 1),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      shadowColor: Colors.grey,
      leading: Container(),

      title: [0, 1, 2].contains(sizeScreen.index)
          ? Padding(
              padding: EdgeInsets.only(left: 50),
              child: Image.asset('assets/imgs/INGLES-PARA-DEVS_logo.png',
                  width: 100),
            )
          : null,
    );
  }

  Widget drawer() {
    return Drawer(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      surfaceTintColor: Color.fromRGBO(255, 255, 255, 1),
      shadowColor: Colors.grey,
      elevation: 5,
      child: Column(
        children: [
          Image.asset('assets/imgs/INGLES-PARA-DEVS_logo.png', width: 100),
          SizedBox(height: 10),
          ListTile(
            title: Text("Registro"),
          ),
          ListTile(
            title: Text("Administrador de preguntas"),
          ),
          Spacer(),
          ListTile(
            title: Text("Salir"),
          ),
        ],
      ),
    );
  }
}
