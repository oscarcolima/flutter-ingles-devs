import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/widget/responsive_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'router/my_router.dart';

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox('registro');
  await Hive.openBox('sesion');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Material App',
      builder: (context, child) => ResponsiveAppWidget(child: child!),
      // home: RegistroPage(),
    );
  }
}
