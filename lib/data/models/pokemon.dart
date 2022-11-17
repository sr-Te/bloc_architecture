import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon extends Equatable {
  const Pokemon({
    required this.name,
    required this.sprite,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  final String name;
  final String sprite;
  final List<StatElement> stats;
  final List<Type> types;
  final int weight;

  @override
  List<Object?> get props => [name, sprite, stats, types, weight];

  static const Map<String, Color> getColor = {
    "normal": Color(0xFFA7A877),
    "fighting": Color(0xffC03128),
    "flying": Color(0xffA890F0),
    "poison": Color(0xff9F419F),
    "ground": Color(0xffe1c068),
    "rock": Color(0xffB8A038),
    "bug": Color(0xffA9B720),
    "ghost": Color(0xff705998),
    "steel": Color(0xffB8B8D0),
    "fire": Color(0xfff08030),
    "water": Color(0xff6890f0),
    "grass": Color(0xff78C84F),
    "electric": Color(0xfff9d030),
    "psychic": Color(0xffF95887),
    "ice": Color(0xff99D7D8),
    "dragon": Color(0xff7138f8),
    "dark": Color(0xff6F5848),
    "fairy": Color(0xffEF99AC),
    "unknown": Color(0x000fffff),
    "shadow": Color(0x000fffff),
  };
}

@JsonSerializable()
class StatElement extends Equatable {
  const StatElement({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatElement.fromJson(Map<String, dynamic> json) =>
      _$StatElementFromJson(json);

  final int baseStat;
  final int effort;
  final TypeClass stat;

  @override
  List<Object?> get props => [baseStat, effort, stat];
}

@JsonSerializable()
class TypeClass extends Equatable {
  const TypeClass({
    required this.name,
    required this.url,
  });

  factory TypeClass.fromJson(Map<String, dynamic> json) =>
      _$TypeClassFromJson(json);

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}

@JsonSerializable()
class Type extends Equatable {
  const Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  final int slot;
  final TypeClass type;

  @override
  List<Object?> get props => [slot, type];
}
