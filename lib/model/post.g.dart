// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      clap: json['clap'] as int,
      view: json['view'] as int,
      release: json['release'] as bool);
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'date': instance.date?.toIso8601String(),
      'clap': instance.clap,
      'view': instance.view,
      'release': instance.release
    };
