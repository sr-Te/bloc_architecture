import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/pokedex/view/pages/pokedex_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const PokedexPage();
        },
        // routes: <RouteBase>[],
      ),
    ],
  );
}
