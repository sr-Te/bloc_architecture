import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pokemon_cubit/pokemon_cubit.dart';

class PokedexPopulated extends StatelessWidget {
  final List<String> pokemonNames;

  PokedexPopulated(this.pokemonNames, {super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          BlocProvider.of<PokemonCubit>(context).fetchPokemons();
        }
        return true;
      },
      child: ListView.builder(
        itemCount: pokemonNames.length,
        itemBuilder: (context, i) => PokemonCard(pokemonNames[i]),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final String pokemon;
  const PokemonCard(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(pokemon);
  }
}
