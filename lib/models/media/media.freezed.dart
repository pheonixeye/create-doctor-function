// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  String get docid => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get title_en => throw _privateConstructorUsedError;
  String get title_ar => throw _privateConstructorUsedError;
  String get description_en => throw _privateConstructorUsedError;
  String get description_ar => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  List<String> get tags_en => throw _privateConstructorUsedError;
  List<String> get tags_ar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call(
      {String docid,
      String link,
      String title_en,
      String title_ar,
      String description_en,
      String description_ar,
      String created_at,
      List<String> tags_en,
      List<String> tags_ar});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docid = null,
    Object? link = null,
    Object? title_en = null,
    Object? title_ar = null,
    Object? description_en = null,
    Object? description_ar = null,
    Object? created_at = null,
    Object? tags_en = null,
    Object? tags_ar = null,
  }) {
    return _then(_value.copyWith(
      docid: null == docid
          ? _value.docid
          : docid // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      title_en: null == title_en
          ? _value.title_en
          : title_en // ignore: cast_nullable_to_non_nullable
              as String,
      title_ar: null == title_ar
          ? _value.title_ar
          : title_ar // ignore: cast_nullable_to_non_nullable
              as String,
      description_en: null == description_en
          ? _value.description_en
          : description_en // ignore: cast_nullable_to_non_nullable
              as String,
      description_ar: null == description_ar
          ? _value.description_ar
          : description_ar // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      tags_en: null == tags_en
          ? _value.tags_en
          : tags_en // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags_ar: null == tags_ar
          ? _value.tags_ar
          : tags_ar // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaImplCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$MediaImplCopyWith(
          _$MediaImpl value, $Res Function(_$MediaImpl) then) =
      __$$MediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String docid,
      String link,
      String title_en,
      String title_ar,
      String description_en,
      String description_ar,
      String created_at,
      List<String> tags_en,
      List<String> tags_ar});
}

/// @nodoc
class __$$MediaImplCopyWithImpl<$Res>
    extends _$MediaCopyWithImpl<$Res, _$MediaImpl>
    implements _$$MediaImplCopyWith<$Res> {
  __$$MediaImplCopyWithImpl(
      _$MediaImpl _value, $Res Function(_$MediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docid = null,
    Object? link = null,
    Object? title_en = null,
    Object? title_ar = null,
    Object? description_en = null,
    Object? description_ar = null,
    Object? created_at = null,
    Object? tags_en = null,
    Object? tags_ar = null,
  }) {
    return _then(_$MediaImpl(
      docid: null == docid
          ? _value.docid
          : docid // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      title_en: null == title_en
          ? _value.title_en
          : title_en // ignore: cast_nullable_to_non_nullable
              as String,
      title_ar: null == title_ar
          ? _value.title_ar
          : title_ar // ignore: cast_nullable_to_non_nullable
              as String,
      description_en: null == description_en
          ? _value.description_en
          : description_en // ignore: cast_nullable_to_non_nullable
              as String,
      description_ar: null == description_ar
          ? _value.description_ar
          : description_ar // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      tags_en: null == tags_en
          ? _value._tags_en
          : tags_en // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags_ar: null == tags_ar
          ? _value._tags_ar
          : tags_ar // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaImpl implements _Media {
  const _$MediaImpl(
      {required this.docid,
      required this.link,
      required this.title_en,
      required this.title_ar,
      required this.description_en,
      required this.description_ar,
      required this.created_at,
      required final List<String> tags_en,
      required final List<String> tags_ar})
      : _tags_en = tags_en,
        _tags_ar = tags_ar;

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

  @override
  final String docid;
  @override
  final String link;
  @override
  final String title_en;
  @override
  final String title_ar;
  @override
  final String description_en;
  @override
  final String description_ar;
  @override
  final String created_at;
  final List<String> _tags_en;
  @override
  List<String> get tags_en {
    if (_tags_en is EqualUnmodifiableListView) return _tags_en;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags_en);
  }

  final List<String> _tags_ar;
  @override
  List<String> get tags_ar {
    if (_tags_ar is EqualUnmodifiableListView) return _tags_ar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags_ar);
  }

  @override
  String toString() {
    return 'Media(docid: $docid, link: $link, title_en: $title_en, title_ar: $title_ar, description_en: $description_en, description_ar: $description_ar, created_at: $created_at, tags_en: $tags_en, tags_ar: $tags_ar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            (identical(other.docid, docid) || other.docid == docid) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.title_en, title_en) ||
                other.title_en == title_en) &&
            (identical(other.title_ar, title_ar) ||
                other.title_ar == title_ar) &&
            (identical(other.description_en, description_en) ||
                other.description_en == description_en) &&
            (identical(other.description_ar, description_ar) ||
                other.description_ar == description_ar) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            const DeepCollectionEquality().equals(other._tags_en, _tags_en) &&
            const DeepCollectionEquality().equals(other._tags_ar, _tags_ar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      docid,
      link,
      title_en,
      title_ar,
      description_en,
      description_ar,
      created_at,
      const DeepCollectionEquality().hash(_tags_en),
      const DeepCollectionEquality().hash(_tags_ar));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      __$$MediaImplCopyWithImpl<_$MediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaImplToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  const factory _Media(
      {required final String docid,
      required final String link,
      required final String title_en,
      required final String title_ar,
      required final String description_en,
      required final String description_ar,
      required final String created_at,
      required final List<String> tags_en,
      required final List<String> tags_ar}) = _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  String get docid;
  @override
  String get link;
  @override
  String get title_en;
  @override
  String get title_ar;
  @override
  String get description_en;
  @override
  String get description_ar;
  @override
  String get created_at;
  @override
  List<String> get tags_en;
  @override
  List<String> get tags_ar;
  @override
  @JsonKey(ignore: true)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
