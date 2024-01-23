// ignore_for_file: non_constant_identifier_names

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
import 'package:starter_template/models/schedule/schedule.dart';
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
  } else {
    final client = Client()
        .setEndpoint(Platform.environment['ADDRESS']!)
        .setProject(Platform.environment['APPWRITE_FUNCTION_PROJECT_ID'])
        .setKey(Platform.environment['APPWRITE_API_KEY'])
        .setSelfSigned();

    final Databases db = Databases(client);

    if (context.req.path == '/create-doctor') {
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
          collectionId: Platform
              .environment['DOCTORS_DATABASE_DOCTOR_DOCUMENTS_COLLECTION']!,
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
    } else if (context.req.path == '/create-clinic') {
      try {
        final body = jsonDecode(context.req.bodyRaw);
        final clinic_id = body['clinic_id'] as String;

        context.log(clinic_id);

        //get clinic created by it's id
        final clinic = await db.getDocument(
          databaseId: Platform.environment['DATABASE_CLINICS']!,
          collectionId:
              Platform.environment['DATABASE_CLINICS_COLLECTION_CLINICS']!,
          documentId: clinic_id,
        );

        if (clinic.$id == clinic_id) {
          //clinic exists

          //create clinic_images document in clinic images collection in clinics database
          await db.createDocument(
            databaseId: Platform.environment['DATABASE_CLINICS']!,
            collectionId: Platform
                .environment['DATABASE_CLINICS_COLLECTION_CLINIC_IMAGES']!,
            documentId: clinic_id,
            data: {
              'images': [],
            },
            permissions: defaultPermissions,
          );
          //create schedule collection in schedule database with id of the clinic
          await db.createCollection(
            databaseId: Platform.environment['DATABASE_SCHEDULE']!,
            collectionId: clinic_id,
            name: clinic.data['mobile'],
            permissions: defaultPermissions,
          );
          //populate schedule collection attributes
          Schedule.scheme.forEach((key, value) async {
            await createAttribute(
              type: value,
              databases: db,
              databaseId: Platform.environment['DATABASE_SCHEDULE']!,
              collectionId: clinic_id,
              key: key,
              size: 100,
              xrequired: true,
            );
          });
          context.log('clinic creation algorithm for $clinic_id complete.');
          return context.res.json({
            'type': 'info',
            'code': 0,
            'reason': 'clinic creation algorithm complete.'
          });
        } else {
          //clinic does not exist
          context.error("Clinic with requested Id does not exist.");
          return context.res.json({
            'type': 'error',
            'code': 2,
            'reason': 'Clinic with requested Id does not exist.'
          });
        }
      } catch (e) {
        context.error(e.toString());
        return context.res.json({
          'type': 'error',
          'code': 2,
          'reason': e.toString(),
        });
      }
    } else {
      return context.res.json({
        'type': 'error',
        'code': 1,
        'reason': 'Bad Request.',
      });
    }
  }
}
