import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:smart_plants/storage.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  if (request.method == HttpMethod.get) {
    final body = await request.body();

    final collection = (await context.read<Future<Storage>>()).reportCollection;

    final pipeline = AggregationPipelineBuilder()
        .addStage(Sort({'date': -1}))
        .addStage(
          Group(
            id: Field('id'),
            fields: {
              'id': First(
                Field('id'),
              ),
              'date': First(
                Field('date'),
              ),
              'humidity': First(
                Field('humidity'),
              ),
            },
          ),
        )
        .build();

    final c = await collection.aggregateToStream(pipeline).toList();

    return Response.json(
      body: c,
    );
  }
  return Response.json(
    body: <String, dynamic>{'ERROR': 'Method not supported'},
  );
}
