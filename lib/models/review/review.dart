// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required String docid,
    required String username,
    required String body,
    required int stars,
  }) = _Review;

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);

  static Map<String, Type> scheme = {
    'docid': String,
    'username': String,
    'body': String,
    'stars': int,
  };
}
