import 'package:flutter_ingles_devs/pages/nivel/nivel_page.dart';
import 'package:flutter_ingles_devs/pages/panel/home/home_page.dart';
import 'package:flutter_ingles_devs/pages/panel/login/login_page.dart';
import 'package:flutter_ingles_devs/pages/registro/registro_page.dart';
import 'package:flutter_ingles_devs/pages/test/test_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  RegistroPage(),
      routes: [
        GoRoute(
          path: 'panel',
          builder: (context, state) => const HomePage(),
          redirect: (context, state) {
            final box = Hive.box("sesion");
            if (box.isEmpty) return "/panel/login";

            return null;
          },
          routes: [
            GoRoute(
              path: 'login',
              builder: (context, state) => LoginPage(),
              redirect: (context, state) {
                final box = Hive.box("sesion");
                if (box.isNotEmpty) return "/panel";

                return null;
              },
            )
          ],
        ),
        GoRoute(
          path: 'test',
          builder: (context, state) => const TestPage(),
          redirect: (context, state) {
            final box = Hive.box("registro");
            if (box.isEmpty) return "/";
            return null;
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
            return null;
          },
        ),
      ],
    ),
  ],
);
