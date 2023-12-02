import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc_observer.dart';
import 'core/injections/bloc_injection.dart';
import 'core/injections/repository_injection.dart';
import 'core/routes/router.dart';
import 'core/themes/app_theme.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: RepositoryInjection.providers,
      child: MultiBlocProvider(
        providers: BlocInjection.providers,
        child: MaterialApp.router(
          title: 'Pokedex',
          theme: AppTheme().mainTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
