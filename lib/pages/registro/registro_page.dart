import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:flutter_ingles_devs/pages/registro/view/contactos_view.dart';
import 'package:flutter_ingles_devs/pages/registro/view/registro.dart';

import 'view/como_funciona_view.dart';
import 'view/determina_nivel_view.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  PrincipalLayout(
      body: SingleChildScrollView(
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
  }
}
