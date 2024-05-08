import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'router/my_router.dart';

Future<void> main() async {
  await Hive.initFlutter();

   await Hive.openBox('registro');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Material App',
      // home: RegistroPage(),
    );
  }
}
