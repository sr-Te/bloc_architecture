import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit() : super(PokemonDetailsInitial());
}
