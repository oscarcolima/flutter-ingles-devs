import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:flutter_ingles_devs/pages/registro/view/contactos_view.dart';
import 'package:flutter_ingles_devs/pages/registro/view/registro.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'provider/registro_page_provaider.dart';
import 'view/como_funciona_view.dart';
import 'view/determina_nivel_view.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final FocusNode _focusNode = FocusNode();
  bool a = false;
  bool ctr = false;
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void shorcut(KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.controlLeft) ctr = true;
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.keyA)
      a = true;

    if (event is KeyUpEvent &&
        event.logicalKey == LogicalKeyboardKey.controlLeft) ctr = false;
    if (event is KeyUpEvent && event.logicalKey == LogicalKeyboardKey.keyA)
      a = false;

    print("a:$a ctr:$ctr");
    if (a && ctr) {
      a = false;
      ctr = false;
      context.go("/panel");
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: shorcut,
      child: ChangeNotifierProvider(
          create: (context) => RegistroPageProvaider(),
          builder: (context, child) {
            return PrincipalLayout(
              body: SingleChildScrollView(
                controller: context.read<RegistroPageProvaider>().controller,
                child: Column(
                  children: [
                    const RegistroView(),
                    const ComoFuncionaView(),
                    DeterminaNivelView(),
                    const ContactosView()
                  ],
                ),
              ),
            );
          }),
    );
  }
}
