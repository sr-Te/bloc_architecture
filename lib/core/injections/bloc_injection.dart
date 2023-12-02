import 'package:bloc_architecture/core/themes/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/pokedex/cubit/pokemon_cubit/pokemon_cubit.dart';
import '../../features/pokedex/data/repository/pokedex_repository.dart';

class BlocInjection {
  static final providers = [
    BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
    BlocProvider<PokemonCubit>(
      create: (context) => PokemonCubit(
        context.read<PokedexRepositoryImpl>(),
      ),
    ),
  ];
}
