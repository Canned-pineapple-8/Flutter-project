// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  image: json['thumbnail'] as String,
  price: (json['price'] as num).toDouble(),
  discountPercentage: (json['discountPercentage'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
);

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'thumbnail': instance.image,
  'price': instance.price,
  'discountPercentage': instance.discountPercentage,
  'rating': instance.rating,
};
