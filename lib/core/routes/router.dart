import 'package:auto_route/auto_route.dart';

import '../../features/pokedex/view/pokedex_page.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: PokedexPage, initial: true),
  ],
)
class $AppRouter {}
