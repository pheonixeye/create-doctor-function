// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_template/models/type_size/type_size.dart';
part 'clinic.freezed.dart';
part 'clinic.g.dart';

@freezed
class Clinic with _$Clinic {
  const factory Clinic({
    required String doc_id,
    required String speciality_en,
    required String speciality_ar,
    required String name_en,
    required String name_ar,
    required String venue_en,
    required String venue_ar,
    required String gov_en,
    required String gov_ar,
    required String city_en,
    required String city_ar,
    required String mobile,
    required String landline,
    required String address_en,
    required String address_ar,
    required String location_link,
    required bool attendance,
    required int fees,
    required int discount,
    required List<String> off_dates,
  }) = _Clinic;

  factory Clinic.fromJson(Map<String, Object?> json) => _$ClinicFromJson(json);

  static Map<String, TypeSize> scheme = {
    'doc_id': TypeSize(String, 100),
    'name_en': TypeSize(String, 100),
    'name_ar': TypeSize(String, 100),
    'venue_en': TypeSize(String, 100),
    'venue_ar': TypeSize(String, 100),
    'speciality_en': TypeSize(String, 100),
    'speciality_ar': TypeSize(String, 100),
    'gov_en': TypeSize(String, 100),
    'gov_ar': TypeSize(String, 100),
    'city_en': TypeSize(String, 100),
    'city_ar': TypeSize(String, 100),
    'mobile': TypeSize(String, 100),
    'landline': TypeSize(String, 100),
    'address_en': TypeSize(String, 100),
    'address_ar': TypeSize(String, 100),
    'location_link': TypeSize(String, 100),
    'attendance': TypeSize(String, 100),
    'fees': TypeSize(int, 100),
    'discount': TypeSize(int, 100),
    'off_dates': TypeSize(List<String>, 100),
  };
}
