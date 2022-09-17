# Official Dart image: https://hub.docker.com/_/dart
# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.17)
FROM dart:2.17.5 AS build

WORKDIR /app

# Resolve app dependencies.
COPY ./build/pubspec.* ./
COPY ./build/config.yaml ./
RUN dart pub get

# Copy app source code and AOT compile it.
COPY ./build ./
# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline
#RUN dart compile exe ./bin/server.dart -o bin/server
#
## Build minimal serving image from AOT-compiled `/server` and required system
## libraries and configuration files stored in `/runtime/` from the build stage.
#FROM scratch
#COPY --from=build /runtime/ /
#COPY --from=build /app/bin/server /app/bin/

# Start server.
#CMD ["/app/bin/server"]
CMD dart ./bin/server.dart