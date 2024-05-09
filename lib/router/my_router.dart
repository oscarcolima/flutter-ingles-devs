import 'package:flutter_ingles_devs/pages/nivel/nivel_page.dart';
import 'package:flutter_ingles_devs/pages/registro/registro_page.dart';
import 'package:flutter_ingles_devs/pages/test/test_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RegistroPage(),
      routes: [
        GoRoute(
          path: 'test',
          builder: (context, state) => const TestPage(),
          redirect: (context, state) {
            final box = Hive.box("registro");
            if (box.isEmpty) return "/";
          },
        ),
        GoRoute(
          path: 'thank',
          builder: (context, state) {
            return const NivelPage();
          },
          redirect: (context, state) {
            final box = Hive.box("registro");
            if (box.get("score") == null) return "/test";
          },
        ),
      ],
    ),
  ],
);
