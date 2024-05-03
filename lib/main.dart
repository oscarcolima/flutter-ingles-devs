import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/layout/principal_layout.dart';

import 'pages/registro/registro_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: RegistroPage(),
    );
  }
}
