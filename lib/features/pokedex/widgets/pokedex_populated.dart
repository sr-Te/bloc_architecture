import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
import '../cubit/pokemon_cubit/pokemon_cubit.dart';
import 'pokemon_card.dart';

class PokedexPopulated extends StatefulWidget {
  final List<Pokemon> pokemons;

  const PokedexPopulated(this.pokemons, {super.key});

  @override
  State<PokedexPopulated> createState() => _PokedexPopulatedState();
}

class _PokedexPopulatedState extends State<PokedexPopulated>
    with TickerProviderStateMixin {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _initVariables();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          BlocProvider.of<PokemonCubit>(context).fetchPokemons();
        }
        return true;
      },
      child: Scaffold(
        body: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 4 / 5,
          ),
          itemCount: widget.pokemons.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, i) => PokemonCard(widget.pokemons[i]),
        ),
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                onPressed: _scrollToTop,
                child: const Icon(Icons.arrow_upward),
              ),
      ),
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  void _initVariables() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }
}
