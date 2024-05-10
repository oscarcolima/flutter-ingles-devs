import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:flutter_ingles_devs/pages/registro/view/registro.dart';

import 'view/como_funciona_view.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrincipalLayout(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegistroView(),
            ComoFuncionaView(),
          ],
        ),
      ),
    );
  }
}
