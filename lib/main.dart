import 'dart:async';
import 'dart:io' show Platform;
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:starter_template/models/article_meta/article_meta.dart';
import 'package:starter_template/models/clinic_visit/clinic_visit.dart';
import 'package:starter_template/models/documents/documents.dart';
import 'package:starter_template/models/invoice/invoice.dart';
import 'package:starter_template/models/review/review.dart';
import 'package:starter_template/utils/create_attribute.dart';

// This is your Appwrite function
// It's executed each time we get a request
Future<dynamic> main(final context) async {
// Why not try the Appwrite SDK?
  //

  if (context.req.method != 'POST') {
    context.error('bad request.');
    context.res.json({
      'type': 'error',
      'code': 1,
      'reason': 'bad request.',
    });
    return;
  }
  final client = Client()
      .setEndpoint('http://localhost:4567/v1')
      .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(Platform.environment['APPWRITE_API_KEY']);

  final Databases db = Databases(client);

  final body = context.req.body;

  final docId = body['docid'] as String;

  try {
    //check if doctor with recieved id is created
    final doctor = await db.getDocument(
      databaseId: Platform.environment['DOCTORS_DATABASE']!,
      collectionId:
          Platform.environment['DOCTORS_DATABASE_DOCTORS_COLLECTION']!,
      documentId: docId,
    );

    //create empty doctor-document ref in doctor-documents collection
    await db.createDocument(
      databaseId: Platform.environment['DATABASE_DOCTORS']!,
      collectionId:
          Platform.environment['DOCTORS_DATABASE_DOCTOR_DOCUMENTS_COLLECTION']!,
      documentId: ID.unique(),
      data: DoctorDocuments(
        docid: doctor.$id,
        synd_card: '',
        permit_cert: '',
        specialist_cert: '',
        consultant_cert: '',
        avatar: '',
      ).toJson(),
    );
    //create empty visits collection in visits db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_VISITS']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: [],
    );

    //populate doctor-visits collection with visit attributes
    ClinicVisit.scheme.forEach((key, Type value) async {
      await createAttribute(
        type: value,
        databases: db,
        databaseId: Platform.environment['DATABASE_VISITS']!,
        collectionId: doctor.$id,
        key: key,
        size: 100,
        xrequired: true,
      );
    });

    //create empty reviews collection in reviews db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_REVIEWS']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: [],
    );

    //populate doctor-reviews collection with review attributes
    Review.scheme.forEach((key, value) async {
      await createAttribute(
        type: value,
        databases: db,
        databaseId: Platform.environment['DATABASE_REVIEWS']!,
        collectionId: doctor.$id,
        key: key,
        size: 100,
        xrequired: true,
      );
    });

    //create empty invoives collection in invoices db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_INVOICES']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: [],
    );

    //populate doctor-invoices collection with invoices attributes
    Invoice.scheme.forEach((key, value) async {
      await createAttribute(
        type: value,
        databases: db,
        databaseId: Platform.environment['DATABASE_INVOICES']!,
        collectionId: doctor.$id,
        key: key,
        size: 100,
        xrequired: true,
      );
    });

    //create empty articles-meta collection in articles-meta db with id of doctor
    await db.createCollection(
      databaseId: Platform.environment['DATABASE_ARTICLES_META']!,
      collectionId: doctor.$id,
      name: doctor.data['name_en'],
      permissions: [],
    );

    //populate doctor-invoices collection with invoices attributes
    ArticleMeta.scheme.forEach((key, value) async {
      await createAttribute(
        type: value,
        databases: db,
        databaseId: Platform.environment['DATABASE_ARTICLES_META']!,
        collectionId: doctor.$id,
        key: key,
        size: 100,
        xrequired: true,
      );
    });

    context.log('doctor creation algorithm complete.');
    context.res.json({
      'type': 'info',
      'code': 0,
      'reason': 'doctor creation algorithm complete.'
    });
  } catch (e) {
    context.error('doctor with requested Id does not exist.');
    context.res.json({
      'type': 'error',
      'code': 2,
      'reason': 'doctor with requested Id does not exist.'
    });
  }
}
