///
//  Generated code. Do not modify.
//  source: movies.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'movies.pb.dart' as $0;
export 'movies.pb.dart';

class TheaterClient extends $grpc.Client {
  static final _$listMovies =
      $grpc.ClientMethod<$0.ListMoviesRequest, $0.ListMoviesResponse>(
          '/movies.Theater/ListMovies',
          ($0.ListMoviesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListMoviesResponse.fromBuffer(value));
  static final _$createMovie = $grpc.ClientMethod<$0.Movie, $0.RequestStatus>(
      '/movies.Theater/CreateMovie',
      ($0.Movie value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RequestStatus.fromBuffer(value));
  static final _$getMovie = $grpc.ClientMethod<$0.MovieRequest, $0.Movie>(
      '/movies.Theater/GetMovie',
      ($0.MovieRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Movie.fromBuffer(value));
  static final _$deleteMovie =
      $grpc.ClientMethod<$0.MovieRequest, $0.RequestStatus>(
          '/movies.Theater/DeleteMovie',
          ($0.MovieRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RequestStatus.fromBuffer(value));

  TheaterClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListMoviesResponse> listMovies(
      $0.ListMoviesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listMovies, request, options: options);
  }

  $grpc.ResponseFuture<$0.RequestStatus> createMovie($0.Movie request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMovie, request, options: options);
  }

  $grpc.ResponseFuture<$0.Movie> getMovie($0.MovieRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMovie, request, options: options);
  }

  $grpc.ResponseFuture<$0.RequestStatus> deleteMovie($0.MovieRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteMovie, request, options: options);
  }
}

abstract class TheaterServiceBase extends $grpc.Service {
  $core.String get $name => 'movies.Theater';

  TheaterServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListMoviesRequest, $0.ListMoviesResponse>(
        'ListMovies',
        listMovies_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListMoviesRequest.fromBuffer(value),
        ($0.ListMoviesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Movie, $0.RequestStatus>(
        'CreateMovie',
        createMovie_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Movie.fromBuffer(value),
        ($0.RequestStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MovieRequest, $0.Movie>(
        'GetMovie',
        getMovie_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MovieRequest.fromBuffer(value),
        ($0.Movie value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MovieRequest, $0.RequestStatus>(
        'DeleteMovie',
        deleteMovie_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MovieRequest.fromBuffer(value),
        ($0.RequestStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListMoviesResponse> listMovies_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListMoviesRequest> request) async {
    return listMovies(call, await request);
  }

  $async.Future<$0.RequestStatus> createMovie_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Movie> request) async {
    return createMovie(call, await request);
  }

  $async.Future<$0.Movie> getMovie_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MovieRequest> request) async {
    return getMovie(call, await request);
  }

  $async.Future<$0.RequestStatus> deleteMovie_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MovieRequest> request) async {
    return deleteMovie(call, await request);
  }

  $async.Future<$0.ListMoviesResponse> listMovies(
      $grpc.ServiceCall call, $0.ListMoviesRequest request);
  $async.Future<$0.RequestStatus> createMovie(
      $grpc.ServiceCall call, $0.Movie request);
  $async.Future<$0.Movie> getMovie(
      $grpc.ServiceCall call, $0.MovieRequest request);
  $async.Future<$0.RequestStatus> deleteMovie(
      $grpc.ServiceCall call, $0.MovieRequest request);
}
