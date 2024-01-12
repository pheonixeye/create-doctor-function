// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      docid: json['docid'] as String,
      link: json['link'] as String,
      title_en: json['title_en'] as String,
      title_ar: json['title_ar'] as String,
      description_en: json['description_en'] as String,
      description_ar: json['description_ar'] as String,
      created_at: json['created_at'] as String,
      tags_en:
          (json['tags_en'] as List<dynamic>).map((e) => e as String).toList(),
      tags_ar:
          (json['tags_ar'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'docid': instance.docid,
      'link': instance.link,
      'title_en': instance.title_en,
      'title_ar': instance.title_ar,
      'description_en': instance.description_en,
      'description_ar': instance.description_ar,
      'created_at': instance.created_at,
      'tags_en': instance.tags_en,
      'tags_ar': instance.tags_ar,
    };
