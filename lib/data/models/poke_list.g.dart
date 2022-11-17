// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'poke_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeList _$PokeListFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PokeList',
      json,
      ($checkedConvert) {
        final val = PokeList(
          count: $checkedConvert('count', (v) => v as int),
          next: $checkedConvert('next', (v) => v as String?),
          previous: $checkedConvert('previous', (v) => v as String?),
          results: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>)
                  .map((e) => PokeListItem.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PokeListToJson(PokeList instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

PokeListItem _$PokeListItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PokeListItem',
      json,
      ($checkedConvert) {
        final val = PokeListItem(
          name: $checkedConvert('name', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$PokeListItemToJson(PokeListItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
