import '../models/models.dart';
import '../provider/pokemon_provider.dart';

class PokemonRepository {
  PokemonRepository({PokemonProvider? pokemonProvider})
      : _pokemonProvider = pokemonProvider ?? PokemonProvider();

  final PokemonProvider _pokemonProvider;

  Future<List<Pokemon?>> getPokemons({required int limit}) async {
    return await _pokemonProvider.getPokemons(limit: limit);
  }
}
