import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:starter_template/models/article_meta/article_meta.dart';
import 'package:starter_template/models/clinic_visit/clinic_visit.dart';
import 'package:starter_template/models/documents/documents.dart';
import 'package:starter_template/models/invoice/invoice.dart';
import 'package:starter_template/models/media/media.dart';
import 'package:starter_template/models/review/review.dart';
import 'package:starter_template/utils/create_attribute.dart';

// This is your Appwrite function
// It's executed each time we get a request
Future<dynamic> main(final context) async {
// Why not try the Appwrite SDK?
  //

  final List<String> defaultPermissions = [
    Permission.read(Role.any()),
    Permission.update(Role.any()),
    Permission.delete(Role.any()),
    Permission.write(Role.any()),
  ];

  if (context.req.method != 'POST') {
    context.error('bad request.');
    return context.res.json({
      'type': 'error',
      'code': 1,
      'reason': 'bad request.',
    });
  }
  final client = Client()
      .setEndpoint(Platform.environment['ADDRESS']!)
      .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(Platform.environment['APPWRITE_API_KEY'])
      .setSelfSigned();

  final Databases db = Databases(client);

  final body = jsonDecode(context.req.bodyRaw);

  // final docId = body['docid'] as String;
  final syndId = body['syndid'] as int;

  context.log(syndId);

  try {
    //check if doctor with recieved id is created
    final doctors = await db.listDocuments(
      databaseId: Platform.environment['DATABASE_DOCTORS']!,
      collectionId:
          Platform.environment['DOCTORS_DATABASE_DOCTORS_COLLECTION']!,
      queries: [
        Query.equal('synd_id', syndId),
      ],
    );

    final doctor = doctors.documents.first;

    final docId = doctor.$id;

    context.log(docId);

    //create empty doctor-document ref in doctor-documents collection
    await db.createDocument(
      databaseId: Platform.environment['DATABASE_DOCTORS']!,
      collectionId:
          Platform.environment['DOCTORS_DATABASE_DOCTOR_DOCUMENTS_COLLECTION']!,
      documentId: doctor.$id,
      data: DoctorDocuments(
        synd_card: '',
        permit_cert: '',
        specialist_cert: '',
        consultant_cert: '',
        avatar: '',
      ).toJson(),
      permissions: defaultPermissions,
    );
    //create empty visits collection in visits db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_VISITS']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: defaultPermissions,
    );

    //populate doctor-visits collection with visit attributes
    ClinicVisit.scheme.forEach((key, value) async {
      await createAttribute(
        type: value.type,
        databases: db,
        databaseId: Platform.environment['DATABASE_VISITS']!,
        collectionId: doctor.$id,
        key: key,
        size: value.size,
        xrequired: true,
      );
    });

    //create empty reviews collection in reviews db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_REVIEWS']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: defaultPermissions,
    );

    //populate doctor-reviews collection with review attributes
    Review.scheme.forEach((key, value) async {
      await createAttribute(
        type: value.type,
        databases: db,
        databaseId: Platform.environment['DATABASE_REVIEWS']!,
        collectionId: doctor.$id,
        key: key,
        size: value.size,
        xrequired: true,
      );
    });

    //create empty invoives collection in invoices db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_INVOICES']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: defaultPermissions,
    );

    //populate doctor-invoices collection with invoices attributes
    Invoice.scheme.forEach((key, value) async {
      await createAttribute(
        type: value.type,
        databases: db,
        databaseId: Platform.environment['DATABASE_INVOICES']!,
        collectionId: doctor.$id,
        key: key,
        size: value.size,
        xrequired: true,
      );
    });

    //create empty articles-meta collection in articles-meta db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_ARTICLES_META']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: defaultPermissions,
    );

    //populate doctor-invoices collection with invoices attributes
    ArticleMeta.scheme.forEach((key, value) async {
      await createAttribute(
        type: value.type,
        databases: db,
        databaseId: Platform.environment['DATABASE_ARTICLES_META']!,
        collectionId: doctor.$id,
        key: key,
        size: value.size,
        xrequired: true,
      );
    });

    //create empty doctor-media collection in media db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_MEDIA']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: defaultPermissions,
    );

    //populate doctor-invoices collection with invoices attributes
    Media.scheme.forEach((key, value) async {
      await createAttribute(
        type: value.type,
        databases: db,
        databaseId: Platform.environment['DATABASE_MEDIA']!,
        collectionId: doctor.$id,
        key: key,
        size: value.size,
        xrequired: true,
      );
    });

    context.log('doctor creation algorithm for doctor $syndId complete.');
    return context.res.json({
      'type': 'info',
      'code': 0,
      'reason': 'doctor creation algorithm complete.'
    });
  } catch (e) {
    context.error(e.toString());
    return context.res.json({
      'type': 'error',
      'code': 2,
      'reason': 'doctor with requested Id does not exist.'
    });
  }
}
