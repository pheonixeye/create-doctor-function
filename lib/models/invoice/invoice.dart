// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  const factory Invoice({
    required String id,
    required String docid,
    required String link,
    required String issued_at,
    required int month,
    required int year,
    required String payment_reference,
    required bool paid,
    required int amount,
    required int tax,
    required double total,
    required List<String> clinic_visits,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, Object?> json) =>
      _$InvoiceFromJson(json);

  static Map<String, Type> scheme = {
    'id': String,
    'docid': String,
    'link': String,
    'issued_at': String,
    'month': int,
    'year': int,
    'payment_reference': String,
    'paid': bool,
    'amount': int,
    'tax': int,
    'total': double,
    'clinic_visits': List<String>,
  };
}