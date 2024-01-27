// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_template/models/type_size/type_size.dart';
part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    required String username,
    required String phone,
    required String doc_reply,
    required String body,
    required String date,
    required int stars,
    required int waiting_time,
  }) = _Review;

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);

  static Map<String, TypeSize> scheme = {
    'username': TypeSize(String, 100),
    'phone': TypeSize(String, 11),
    'body': TypeSize(String, 400),
    'date': TypeSize(String, 50),
    'doc_reply': TypeSize(String, 400),
    'stars': TypeSize(int, 100),
    'waiting_time': TypeSize(int, 100),
  };
}
