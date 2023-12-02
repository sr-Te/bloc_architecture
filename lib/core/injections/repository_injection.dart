import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/pokedex/data/repository/pokedex_repository.dart';

class RepositoryInjection {
  static final providers = [
    RepositoryProvider<PokedexRepositoryImpl>(
      create: (context) => PokedexRepositoryImpl(),
    ),
  ];
}
