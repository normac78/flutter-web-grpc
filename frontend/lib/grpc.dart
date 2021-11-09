// Run from project root to regenerate Dart protobufs manually
// dart pub global activate protoc_plugin
// protoc --dart_out=grpc:frontend/lib/src/generated -Iprotos protos/movies.proto

import 'package:grpc/grpc_web.dart';
import 'package:theater_app/src/generated/movies.pbgrpc.dart';

const theaterHost = String.fromEnvironment('GOHOME_HOST',
    defaultValue: 'http://localhost:8081');

TheaterClient initTheaterClient() {
  final channel = GrpcWebClientChannel.xhr(Uri.parse(theaterHost));
  final goHomeStub = TheaterClient(
    channel,
    options: CallOptions(
      timeout: const Duration(seconds: 30),
    ),
  );
  return goHomeStub;
}
