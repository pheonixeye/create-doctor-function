import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';

Future<Model> createAttribute({
  required Type type,
  required Databases databases,
  required String databaseId,
  required String collectionId,
  required String key,
  required int size,
  required bool xrequired,
  dynamic xdefault,
  bool? array,
  bool? encrypt,
  dynamic min,
  dynamic max,
}) async {
  switch (type) {
    case String:
      assert(xdefault is String);
      return databases.createStringAttribute(
        databaseId: databaseId,
        collectionId: collectionId,
        key: key,
        size: size,
        xrequired: xrequired,
        xdefault: xdefault,
        array: array,
        // encrypt: encrypt,
      );
    case int:
      assert(min is int && max is int);
      assert(xdefault is int);
      return databases.createIntegerAttribute(
        databaseId: databaseId,
        collectionId: collectionId,
        key: key,
        xrequired: xrequired,
        xdefault: xdefault,
        array: array,
        max: max,
        min: min,
      );
    case bool:
      assert(xdefault is bool);
      return databases.createBooleanAttribute(
        databaseId: databaseId,
        collectionId: collectionId,
        key: key,
        xrequired: xrequired,
        xdefault: xdefault,
        array: array,
      );
    case double:
      assert(min is double && max is double);
      assert(xdefault is double);
      return databases.createFloatAttribute(
        databaseId: databaseId,
        collectionId: collectionId,
        key: key,
        xrequired: xrequired,
        xdefault: xdefault,
        array: array,
        min: min,
        max: max,
      );
    case List<String>:
      assert(xdefault is String);
      return databases.createStringAttribute(
        databaseId: databaseId,
        collectionId: collectionId,
        key: key,
        size: size,
        xrequired: xrequired,
        xdefault: xdefault,
        array: true,
        // encrypt: encrypt,
      );
    default:
      throw UnimplementedError();
  }
}
