import 'package:bloc_architecture/core/themes/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/pokemon_cubit/pokemon_cubit.dart';
import '../widgets/pokedex_populated.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        actions: [
          IconButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            icon: Icon(
              isLight ? Icons.dark_mode_sharp : Icons.light_mode_sharp,
            ),
          ),
        ],
      ),
      body: BlocConsumer<PokemonCubit, PokemonState>(
        listener: (context, state) {
          if (state.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 3),
              content: Text('🙈 Something went wrong!'),
            ));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // If data is currently loading, the interface displays the data
              // previosly obtained with a linear progress indicator.
              // Otherwise, it shows the loaded data and a container to fills
              // the space previously occupied by the loading indicator.
              state.isLoading
                  ? const LinearProgressIndicator()
                  : Container(height: 3),

              Expanded(child: PokedexPopulated(state.pokemons)),
            ],
          );
        },
      ),
    );
  }
}
