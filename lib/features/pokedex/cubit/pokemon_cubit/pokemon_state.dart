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
    List<String>? pokemonNames,
  }) : pokemonNames = pokemonNames ?? List<String>.empty();

  final PokemonStatus status;
  final List<String> pokemonNames;

  PokemonState copyWith({
    PokemonStatus? status,
    List<String>? pokemonNames,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemonNames: pokemonNames ?? this.pokemonNames,
    );
  }

  @override
  List<Object> get props => [status, pokemonNames];
}
