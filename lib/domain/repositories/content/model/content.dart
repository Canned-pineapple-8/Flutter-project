import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable()
class Content {
  final int id;
  final String title;
  final String description;
  @JsonKey(name: 'thumbnail')
  final String image;

  Content({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
