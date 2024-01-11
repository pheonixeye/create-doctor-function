// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_meta.freezed.dart';
part 'article_meta.g.dart';

@freezed
class ArticleMeta with _$ArticleMeta {
  const factory ArticleMeta({
    required String id,
    required String docid, //redundant
    required String title_en,
    required String title_ar,
    required String description_en,
    required String description_ar,
    required String created_at,
    required String thumbnail,
    required String article_id,
  }) = _ArticleMeta;

  factory ArticleMeta.fromJson(Map<String, Object?> json) =>
      _$ArticleMetaFromJson(json);

  static const Map<String, Type> scheme = {
    'id': String,
    'docid': String,
    'title_en': String,
    'title_ar': String,
    'description_en': String,
    'description_ar': String,
    'created_at': String,
    'thumbnail': String,
    'article_id': String,
  };
}
