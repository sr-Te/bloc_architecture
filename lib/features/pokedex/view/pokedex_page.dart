import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pokemon_cubit/pokemon_cubit.dart';
import '../widgets/pokedex_widgets.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          return Column(
            children: [
              state.status == PokemonStatus.loading
                  ? const LinearProgressIndicator()
                  : Container(height: 3),
              Expanded(child: PokedexPopulated(state.pokemonNames)),
            ],
          );
        },
      ),
    );
  }
}
