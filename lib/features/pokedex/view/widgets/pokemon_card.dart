import 'package:flutter/material.dart';

import '../../data/models/models.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('#${pokemon.id}'),
          _pokemonImage(pokemon.getImageUrl),
          Text(
            pokemon.name,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _pokemonImage(String getImageUrl) => Image.network(
        getImageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return SizedBox(
              height: 70,
              width: 70,
              child: child,
            );
          }

          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
}
