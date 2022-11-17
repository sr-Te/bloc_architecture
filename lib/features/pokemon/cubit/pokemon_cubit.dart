import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../data/models/models.dart';
import '../../../data/repository/pokemon_repository.dart';

part 'pokemon_cubit.g.dart';
part 'pokemon_state.dart';

class PokemonCubit extends HydratedCubit<PokemonState> {
  PokemonCubit(this._pokemonRepository) : super(PokemonState());

  final PokemonRepository _pokemonRepository;

  Future<void> fetchPokemons({int limit = 50}) async {
    emit(state.copyWith(status: PokemonStatus.loading));

    try {
      final pokemons = await _pokemonRepository.getPokemons(limit: limit);
      emit(state.copyWith(status: PokemonStatus.success, pokemons: pokemons));
    } on Exception {
      emit(state.copyWith(status: PokemonStatus.failure));
    }
  }

  @override
  PokemonState? fromJson(Map<String, dynamic> json) =>
      PokemonState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(PokemonState state) => state.toJson();
}
