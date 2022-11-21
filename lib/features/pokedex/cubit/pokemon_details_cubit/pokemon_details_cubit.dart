import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/models.dart';
import '../../../../data/repository/pokedex_repository.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit(this._pokemonRepository)
      : super(const PokemonDetailsState());

  final PokedexRepository _pokemonRepository;

  Future<void> getPokemonDetails(String pokemonName) async {
    emit(state.copyWith(status: PokemonDetailsStatus.loading));

    try {
      final pDetails = await _pokemonRepository.getPokemonDetails(pokemonName);
      emit(
        state.copyWith(status: PokemonDetailsStatus.success, details: pDetails),
      );
    } on Exception {
      emit(state.copyWith(status: PokemonDetailsStatus.failure));
    }
  }
}
