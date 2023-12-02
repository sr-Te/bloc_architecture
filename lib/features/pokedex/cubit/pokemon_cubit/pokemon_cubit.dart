import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/models/models.dart';
import '../../data/repository/pokedex_repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit(this._pokemonRepository) : super(PokemonState()) {
    fetchPokemons();
  }

  final PokedexRepository _pokemonRepository;
  final limit = 20;
  int offset = 0;

  Future<void> fetchPokemons() async {
    emit(state.copyWith(status: PokemonStatus.loading));

    try {
      final pokemons = await _pokemonRepository.getPokemonList(
        offset: offset,
        limit: limit,
      );

      offset += limit;

      emit(state.copyWith(
        status: PokemonStatus.success,
        pokemons: [...state.pokemons, ...pokemons],
      ));
    } on Exception {
      emit(state.copyWith(status: PokemonStatus.failure));
    }
  }
}
