import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc_observer.dart';
import 'core/routes/router.gr.dart';
import 'core/themes/app_theme.dart';
import 'data/repository/pokedex_repository.dart';
import 'features/pokedex/cubit/pokemon_cubit/pokemon_cubit.dart';

// https://github.com/cscoderr/Pokedex
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PokedexRepositoryImpl>(
          create: (context) => PokedexRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonCubit>(
            create: (context) => PokemonCubit(
              context.read<PokedexRepositoryImpl>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: 'Bienestar Animal',
          theme: AppTheme().mainTheme,
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
