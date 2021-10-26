///
//  Generated code. Do not modify.
//  source: movies.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'movies.pbenum.dart';

export 'movies.pbenum.dart';

class RequestStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'movies'), createEmptyInstance: create)
    ..e<RequestStatus_StatusCode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OE, defaultOrMaker: RequestStatus_StatusCode.SUCCESS, valueOf: RequestStatus_StatusCode.valueOf, enumValues: RequestStatus_StatusCode.values)
    ..hasRequiredFields = false
  ;

  RequestStatus._() : super();
  factory RequestStatus({
    RequestStatus_StatusCode? code,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory RequestStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestStatus clone() => RequestStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestStatus copyWith(void Function(RequestStatus) updates) => super.copyWith((message) => updates(message as RequestStatus)) as RequestStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestStatus create() => RequestStatus._();
  RequestStatus createEmptyInstance() => create();
  static $pb.PbList<RequestStatus> createRepeated() => $pb.PbList<RequestStatus>();
  @$core.pragma('dart2js:noInline')
  static RequestStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestStatus>(create);
  static RequestStatus? _defaultInstance;

  @$pb.TagNumber(1)
  RequestStatus_StatusCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(RequestStatus_StatusCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);
}

class Person extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Person', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'movies'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Person._() : super();
  factory Person({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Person.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Person.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Person clone() => Person()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Person copyWith(void Function(Person) updates) => super.copyWith((message) => updates(message as Person)) as Person; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Person create() => Person._();
  Person createEmptyInstance() => create();
  static $pb.PbList<Person> createRepeated() => $pb.PbList<Person>();
  @$core.pragma('dart2js:noInline')
  static Person getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Person>(create);
  static Person? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class Movie extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Movie', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'movies'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<Person>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actors', $pb.PbFieldType.PM, subBuilder: Person.create)
    ..aOM<Person>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'director', subBuilder: Person.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'posterUrl')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trailerUrl')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'releaseYear')
    ..hasRequiredFields = false
  ;

  Movie._() : super();
  factory Movie({
    $fixnum.Int64? id,
    $core.String? name,
    $core.Iterable<Person>? actors,
    Person? director,
    $core.String? posterUrl,
    $core.String? trailerUrl,
    $fixnum.Int64? releaseYear,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (actors != null) {
      _result.actors.addAll(actors);
    }
    if (director != null) {
      _result.director = director;
    }
    if (posterUrl != null) {
      _result.posterUrl = posterUrl;
    }
    if (trailerUrl != null) {
      _result.trailerUrl = trailerUrl;
    }
    if (releaseYear != null) {
      _result.releaseYear = releaseYear;
    }
    return _result;
  }
  factory Movie.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Movie.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Movie clone() => Movie()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Movie copyWith(void Function(Movie) updates) => super.copyWith((message) => updates(message as Movie)) as Movie; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Movie create() => Movie._();
  Movie createEmptyInstance() => create();
  static $pb.PbList<Movie> createRepeated() => $pb.PbList<Movie>();
  @$core.pragma('dart2js:noInline')
  static Movie getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Movie>(create);
  static Movie? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Person> get actors => $_getList(2);

  @$pb.TagNumber(4)
  Person get director => $_getN(3);
  @$pb.TagNumber(4)
  set director(Person v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDirector() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirector() => clearField(4);
  @$pb.TagNumber(4)
  Person ensureDirector() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get posterUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set posterUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPosterUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearPosterUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get trailerUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set trailerUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTrailerUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrailerUrl() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get releaseYear => $_getI64(6);
  @$pb.TagNumber(7)
  set releaseYear($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasReleaseYear() => $_has(6);
  @$pb.TagNumber(7)
  void clearReleaseYear() => clearField(7);
}

class MovieRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MovieRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'movies'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  MovieRequest._() : super();
  factory MovieRequest({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory MovieRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MovieRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MovieRequest clone() => MovieRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MovieRequest copyWith(void Function(MovieRequest) updates) => super.copyWith((message) => updates(message as MovieRequest)) as MovieRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MovieRequest create() => MovieRequest._();
  MovieRequest createEmptyInstance() => create();
  static $pb.PbList<MovieRequest> createRepeated() => $pb.PbList<MovieRequest>();
  @$core.pragma('dart2js:noInline')
  static MovieRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MovieRequest>(create);
  static MovieRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ListMoviesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListMoviesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'movies'), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.P6)
    ..hasRequiredFields = false
  ;

  ListMoviesRequest._() : super();
  factory ListMoviesRequest({
    $core.Iterable<$fixnum.Int64>? ids,
  }) {
    final _result = create();
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    return _result;
  }
  factory ListMoviesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMoviesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMoviesRequest clone() => ListMoviesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMoviesRequest copyWith(void Function(ListMoviesRequest) updates) => super.copyWith((message) => updates(message as ListMoviesRequest)) as ListMoviesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListMoviesRequest create() => ListMoviesRequest._();
  ListMoviesRequest createEmptyInstance() => create();
  static $pb.PbList<ListMoviesRequest> createRepeated() => $pb.PbList<ListMoviesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListMoviesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoviesRequest>(create);
  static ListMoviesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get ids => $_getList(0);
}

class ListMoviesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListMoviesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'movies'), createEmptyInstance: create)
    ..pc<Movie>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'movies', $pb.PbFieldType.PM, subBuilder: Movie.create)
    ..hasRequiredFields = false
  ;

  ListMoviesResponse._() : super();
  factory ListMoviesResponse({
    $core.Iterable<Movie>? movies,
  }) {
    final _result = create();
    if (movies != null) {
      _result.movies.addAll(movies);
    }
    return _result;
  }
  factory ListMoviesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListMoviesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListMoviesResponse clone() => ListMoviesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListMoviesResponse copyWith(void Function(ListMoviesResponse) updates) => super.copyWith((message) => updates(message as ListMoviesResponse)) as ListMoviesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListMoviesResponse create() => ListMoviesResponse._();
  ListMoviesResponse createEmptyInstance() => create();
  static $pb.PbList<ListMoviesResponse> createRepeated() => $pb.PbList<ListMoviesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListMoviesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListMoviesResponse>(create);
  static ListMoviesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Movie> get movies => $_getList(0);
}

