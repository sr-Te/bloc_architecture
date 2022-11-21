part of 'pokemon_details_cubit.dart';

enum PokemonDetailsStatus { initial, loading, success, failure }

extension PokemonDetailsStatusX on PokemonDetailsStatus {
  bool get isInitial => this == PokemonDetailsStatus.initial;
  bool get isLoading => this == PokemonDetailsStatus.loading;
  bool get isSuccess => this == PokemonDetailsStatus.success;
  bool get isFailure => this == PokemonDetailsStatus.failure;
}

class PokemonDetailsState extends Equatable {
  const PokemonDetailsState({
    this.status = PokemonDetailsStatus.initial,
    this.details,
  });

  final PokemonDetailsStatus status;
  final PokemonDetails? details;

  PokemonDetailsState copyWith({
    PokemonDetailsStatus? status,
    PokemonDetails? details,
  }) {
    return PokemonDetailsState(
      status: status ?? this.status,
      details: details ?? this.details,
    );
  }

  @override
  List<Object?> get props => [status, details];
}
