// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_template/models/type_size/type_size.dart';
part 'clinic_visit.freezed.dart';
part 'clinic_visit.g.dart';

@freezed
class ClinicVisit with _$ClinicVisit {
  const factory ClinicVisit({
    required String id,
    required String pt_name,
    required String pt_phone,
    required String doc_id,
    required String clinic_id,
    required String date,
    required String type,
    required bool attended,
  }) = _ClinicVisit;

  factory ClinicVisit.fromJson(Map<String, Object?> json) =>
      _$ClinicVisitFromJson(json);

  static const Map<String, TypeSize> scheme = {
    'id': TypeSize(String, 100),
    'pt_name': TypeSize(String, 200),
    'pt_phone': TypeSize(String, 100),
    'doc_id': TypeSize(String, 100),
    'clinic_id': TypeSize(String, 100),
    'date': TypeSize(String, 100),
    'type': TypeSize(String, 100),
    'attended': TypeSize(bool, 100),
  };
}
