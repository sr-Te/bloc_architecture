import '../models/models.dart';
import '../provider/pokedex_provider.dart';

abstract class PokedexRepository {
  Future<List<Pokemon>> getPokemonList({int? offset, int? limit});
  Future<PokemonDetails> getPokemonDetails(String pokemonName);
}

class PokedexRepositoryImpl implements PokedexRepository {
  PokedexRepositoryImpl({PokedexProvider? pokedexProvider})
      : _pokedexProvider = pokedexProvider ?? PokedexProviderImpl();

  final PokedexProvider _pokedexProvider;

  @override
  Future<List<Pokemon>> getPokemonList({int? offset, int? limit}) async {
    final pokeRes = await _pokedexProvider.getPokemonList(
      offset: offset,
      limit: limit,
    );
    return pokeRes.results;
  }

  @override
  Future<PokemonDetails> getPokemonDetails(String pokemonName) async {
    return await _pokedexProvider.getPokemonDetails(pokemonName);
  }
}
