import 'package:flutter_ingles_devs/pages/nivel/nivel_page.dart';
import 'package:flutter_ingles_devs/pages/registro/registro_page.dart';
import 'package:flutter_ingles_devs/pages/test/test_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const RegistroPage(),
        routes: [
          GoRoute(
            path: 'test',
            builder: (context, state) => const TestPage(),
          ),
          GoRoute(
              path: 'thank/:usuario',
              builder: (context, state) {
                final usuario = state.pathParameters['userId'];
                return const NivelPage();
              }),
        ]),
  ],
);
