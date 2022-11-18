import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api/poke_api.dart';
import '../models/models.dart';

class PokemonRequestFailure implements Exception {}

abstract class PokedexProvider {
  Future<PokemonResponse> getPokemonList({int? offset, int? limit});
  Future<PokemonDetails> getPokemonDetails(String pokemonName);
}

class PokedexProviderImpl implements PokedexProvider {
  PokedexProviderImpl({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  @override
  Future<PokemonDetails> getPokemonDetails(String pokemonName) async {
    final res = await _httpClient.get(PokeApi.pokemonDetails(pokemonName));
    if (res.statusCode != 200) throw PokemonRequestFailure();
    return PokemonDetails.fromJson(jsonDecode(res.body));
  }

  @override
  Future<PokemonResponse> getPokemonList({int? offset, int? limit}) async {
    final res = await _httpClient.get(
      PokeApi.pokemons(offset: offset ?? 0, limit: limit ?? 20),
    );
    if (res.statusCode != 200) throw PokemonRequestFailure();
    return PokemonResponse.fromJson(jsonDecode(res.body));
  }
}
