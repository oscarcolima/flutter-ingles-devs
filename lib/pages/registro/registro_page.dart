import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';
import 'package:flutter_ingles_devs/pages/registro/view/registro.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrincipalLayout(
      body: SingleChildScrollView(
        child: Column(
          children: [Registro()],
        ),
      ),
    );
  }
}
