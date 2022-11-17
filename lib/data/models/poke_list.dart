import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poke_list.g.dart';

@JsonSerializable()
class PokeList extends Equatable {
  const PokeList({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokeList.fromJson(Map<String, dynamic> json) =>
      _$PokeListFromJson(json);

  final int count;
  final String? next;
  final String? previous;
  final List<PokeListItem> results;

  @override
  List<Object?> get props => [next, previous, results];
}

@JsonSerializable()
class PokeListItem extends Equatable {
  const PokeListItem({
    required this.name,
    required this.url,
  });

  factory PokeListItem.fromJson(Map<String, dynamic> json) =>
      _$PokeListItemFromJson(json);

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
