class PokeApi {
  static const _baseUrl = 'pokeapi.co';

  static Uri pokemons({int? offset, int? limit}) => Uri.https(
      _baseUrl, 'api/v2/pokemon', {'offset': '$offset', 'limit': '$limit'});

  static Uri pokemonDetails(String name) =>
      Uri.https(_baseUrl, 'api/v2/pokemon/$name');
}
