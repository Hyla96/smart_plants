# Official Dart image: https://hub.docker.com/_/dart
# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.17)
FROM dart:2.17.5 AS build

WORKDIR /app

# Resolve app dependencies.
COPY . .

RUN dart pub get
RUN dart pub global activate dart_frog_cli
RUN export PATH="$PATH":"$HOME/.pub-cache/bin" && dart_frog build

RUN dart compile exe ./build/bin/server.dart -o ./build/bin/server

# Start server.
CMD ["./build/bin/server"]
#CMD dart ./bin/server.dart