// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Pokemon',
      json,
      ($checkedConvert) {
        final val = Pokemon(
          name: $checkedConvert('name', (v) => v as String),
          sprite: $checkedConvert('sprite', (v) => v as String),
          stats: $checkedConvert(
              'stats',
              (v) => (v as List<dynamic>)
                  .map((e) => StatElement.fromJson(e as Map<String, dynamic>))
                  .toList()),
          types: $checkedConvert(
              'types',
              (v) => (v as List<dynamic>)
                  .map((e) => Type.fromJson(e as Map<String, dynamic>))
                  .toList()),
          weight: $checkedConvert('weight', (v) => v as int),
        );
        return val;
      },
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'sprite': instance.sprite,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };

StatElement _$StatElementFromJson(Map<String, dynamic> json) => $checkedCreate(
      'StatElement',
      json,
      ($checkedConvert) {
        final val = StatElement(
          baseStat: $checkedConvert('base_stat', (v) => v as int),
          effort: $checkedConvert('effort', (v) => v as int),
          stat: $checkedConvert(
              'stat', (v) => TypeClass.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'baseStat': 'base_stat'},
    );

Map<String, dynamic> _$StatElementToJson(StatElement instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

TypeClass _$TypeClassFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TypeClass',
      json,
      ($checkedConvert) {
        final val = TypeClass(
          name: $checkedConvert('name', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$TypeClassToJson(TypeClass instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Type',
      json,
      ($checkedConvert) {
        final val = Type(
          slot: $checkedConvert('slot', (v) => v as int),
          type: $checkedConvert(
              'type', (v) => TypeClass.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
