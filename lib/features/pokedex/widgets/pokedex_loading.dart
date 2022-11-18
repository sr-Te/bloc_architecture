import 'package:bloc_architecture/features/pokedex/widgets/pokedex_populated.dart';
import 'package:flutter/material.dart';

class PokedexLoading extends StatelessWidget {
  final List<String> pokemonNames;
  const PokedexLoading(this.pokemonNames, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(),
        Expanded(child: PokedexPopulated(pokemonNames)),
      ],
    );
  }
}
