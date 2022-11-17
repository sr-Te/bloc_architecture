// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'pokemon_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonState _$PokemonStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PokemonState',
      json,
      ($checkedConvert) {
        final val = PokemonState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$PokemonStatusEnumMap, v) ??
                  PokemonStatus.initial),
          pokemons: $checkedConvert(
              'pokemons',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => e == null
                      ? null
                      : Pokemon.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PokemonStateToJson(PokemonState instance) =>
    <String, dynamic>{
      'status': _$PokemonStatusEnumMap[instance.status]!,
      'pokemons': instance.pokemons,
    };

const _$PokemonStatusEnumMap = {
  PokemonStatus.initial: 'initial',
  PokemonStatus.loading: 'loading',
  PokemonStatus.success: 'success',
  PokemonStatus.failure: 'failure',
};
