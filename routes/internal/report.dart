import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:smart_plants/models/report.dart';
import 'package:smart_plants/storage.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  if (request.method == HttpMethod.post) {
    final body = await request.body();

    Report? report;
    if (body.isNotEmpty) {
      report = Report.fromJson(json.decode(body) as Map<String, dynamic>).copyWith(
        date: DateTime.now().millisecondsSinceEpoch,
      );

      final collection = (await context.read<Future<Storage>>()).reportCollection;

      final c = await collection.insertOne(
        report.toJson(),
      );

      return Response.json(
        body: c.document,
      );
    }

    return Response.json(
      body: null,
    );
  }
  return Response.json(
    body: <String, dynamic>{'ERROR': 'Method not supported'},
  );
}
