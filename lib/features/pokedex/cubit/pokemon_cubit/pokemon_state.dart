part of 'pokemon_cubit.dart';

enum PokemonStatus { initial, loading, success, failure }

extension PokemonStatusX on PokemonStatus {
  bool get isInitial => this == PokemonStatus.initial;
  bool get isLoading => this == PokemonStatus.loading;
  bool get isSuccess => this == PokemonStatus.success;
  bool get isFailure => this == PokemonStatus.failure;
}

@JsonSerializable()
class PokemonState extends Equatable {
  PokemonState({
    this.status = PokemonStatus.initial,
    List<Pokemon>? pokemons,
  }) : pokemons = pokemons ?? [];

  final PokemonStatus status;
  final List<Pokemon> pokemons;

  PokemonState copyWith({
    PokemonStatus? status,
    List<Pokemon>? pokemons,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
    );
  }

  @override
  List<Object> get props => [status, pokemons];
}
