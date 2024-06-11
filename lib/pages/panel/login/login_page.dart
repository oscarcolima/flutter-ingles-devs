import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/pages/panel/login/view/formulario.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = context
        .select<ResponsiveApp, SizeScreen>((ResponsiveApp p) => p.sizeScreen);

    return Scaffold(
      body: [0, 1, 2].contains(sizeScreen.index)
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image.asset(
                    'assets/imgs/INGLES-PARA-DEVS_logo.png',
                    width: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          [0].contains(sizeScreen.index) ? 10 : 50),
                  child: const Formulario(),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image.asset('assets/imgs/INGLES-PARA-DEVS_logo.png'),
                )),
                Expanded(
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: const Formulario(),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
