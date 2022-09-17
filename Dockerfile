# Official Dart image: https://hub.docker.com/_/dart
# Specify the Dart SDK base image version using dart:<version> (ex: dart:2.17)
FROM dart:2.17.5 AS build

WORKDIR /app

# Resolve app dependencies.
COPY build ./
COPY build/config.yaml /app/config.yaml

RUN dart pub get

RUN dart compile exe ./bin/server.dart -o /app/server
#
## Build minimal serving image from AOT-compiled `/server` and required system
## libraries and configuration files stored in `/runtime/` from the build stage.
#FROM scratch
#COPY --from=build /runtime/ /
#COPY --from=build /app/bin/server /app/bin/

# Start server.
CMD ["/app/server"]
#CMD dart ./bin/server.dart