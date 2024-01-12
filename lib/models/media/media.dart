// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_template/models/type_size/type_size.dart';
part 'media.freezed.dart';
part 'media.g.dart';

@freezed
class Media with _$Media {
  const factory Media({
    required String docid,
    required String link,
    required String title_en,
    required String title_ar,
    required String description_en,
    required String description_ar,
    required String created_at,
    required List<String> tags_en,
    required List<String> tags_ar,
  }) = _Media;

  factory Media.fromJson(Map<String, Object?> json) => _$MediaFromJson(json);

  static Map<String, TypeSize> scheme = {
    'docid': TypeSize(String, 100),
    'link': TypeSize(String, 100),
    'title_en': TypeSize(String, 200),
    'title_ar': TypeSize(String, 200),
    'description_en': TypeSize(String, 400),
    'description_ar': TypeSize(String, 400),
    'created_at': TypeSize(String, 100),
    'tags_en': TypeSize(List<String>, 100),
    'tags_ar': TypeSize(List<String>, 100),
  };
}
