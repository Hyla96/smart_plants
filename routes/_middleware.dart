import 'package:dart_frog/dart_frog.dart';
import 'package:smart_plants/configuration.dart';
import 'package:smart_plants/storage.dart';

Storage? _storage;
Configuration? _configuration;

// Handler middleware(Handler handler) => handler.use(storageProvider());
Handler middleware(Handler handler) => handler
    .use(
      configProvider(),
    )
    .use(
      storageProvider(),
    );

Middleware storageProvider() {
  return provider<Future<Storage>>((context) async {
    _configuration ??= await Configuration.create();
    return _storage ??= await Storage.create(
      _configuration!,
    );
  });
}

Middleware configProvider() {
  return provider<Future<Configuration>>(
    (context) async => _configuration ??= await Configuration.create(),
  );
}
