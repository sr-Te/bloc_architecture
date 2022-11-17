import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class PokemonRequestFailure implements Exception {}

class PokemonNotFoundFailure implements Exception {}

class PokemonProvider {
  PokemonProvider({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrlPokeApi = ' https://pokeapi.co/api/v2';
  final http.Client _httpClient;

  Future<List<Pokemon?>> getPokemons({required int limit}) async {
    final pokeListRequest = Uri.https(
      _baseUrlPokeApi,
      'pokemon',
      {'limit': '$limit'},
    );

    final pokeListResponse = await _httpClient.get(pokeListRequest);
    if (pokeListResponse.statusCode != 200) {
      throw PokemonRequestFailure();
    }

    final pokeListJson =
        jsonDecode(pokeListResponse.body) as Map<String, dynamic>;
    final pokeList = PokeList.fromJson(pokeListJson);

    List<Pokemon?> pokemons = [];
    for (var pokeItem in pokeList.results) {
      final pokemonDetail = await getPokemonDetailFromUrl(pokeItem.url);
      pokemons.add(pokemonDetail);
    }

    return pokemons;
  }

  Future<Pokemon?> getPokemonDetailFromUrl(String url) async {
    final pokeDetailRequest = Uri.https(url);

    final pokeDetailResponse = await _httpClient.get(pokeDetailRequest);
    if (pokeDetailResponse.statusCode != 200) {
      return null;
    }

    final pokemonJson =
        jsonDecode(pokeDetailResponse.body) as Map<String, dynamic>;
    return Pokemon.fromJson(pokemonJson);
  }
}
