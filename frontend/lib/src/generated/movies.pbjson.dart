///
//  Generated code. Do not modify.
//  source: movies.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use requestStatusDescriptor instead')
const RequestStatus$json = const {
  '1': 'RequestStatus',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 14, '6': '.movies.RequestStatus.StatusCode', '10': 'code'},
  ],
  '4': const [RequestStatus_StatusCode$json],
};

@$core.Deprecated('Use requestStatusDescriptor instead')
const RequestStatus_StatusCode$json = const {
  '1': 'StatusCode',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'FAILED', '2': 1},
  ],
};

/// Descriptor for `RequestStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestStatusDescriptor = $convert.base64Decode('Cg1SZXF1ZXN0U3RhdHVzEjQKBGNvZGUYASABKA4yIC5tb3ZpZXMuUmVxdWVzdFN0YXR1cy5TdGF0dXNDb2RlUgRjb2RlIiUKClN0YXR1c0NvZGUSCwoHU1VDQ0VTUxAAEgoKBkZBSUxFRBAB');
@$core.Deprecated('Use personDescriptor instead')
const Person$json = const {
  '1': 'Person',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Person`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personDescriptor = $convert.base64Decode('CgZQZXJzb24SEgoEbmFtZRgBIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use movieDescriptor instead')
const Movie$json = const {
  '1': 'Movie',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'actors', '3': 3, '4': 3, '5': 11, '6': '.movies.Person', '10': 'actors'},
    const {'1': 'director', '3': 4, '4': 1, '5': 11, '6': '.movies.Person', '10': 'director'},
    const {'1': 'poster_url', '3': 5, '4': 1, '5': 9, '10': 'posterUrl'},
    const {'1': 'trailer_url', '3': 6, '4': 1, '5': 9, '10': 'trailerUrl'},
    const {'1': 'release_year', '3': 7, '4': 1, '5': 3, '10': 'releaseYear'},
  ],
};

/// Descriptor for `Movie`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List movieDescriptor = $convert.base64Decode('CgVNb3ZpZRIOCgJpZBgBIAEoA1ICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRImCgZhY3RvcnMYAyADKAsyDi5tb3ZpZXMuUGVyc29uUgZhY3RvcnMSKgoIZGlyZWN0b3IYBCABKAsyDi5tb3ZpZXMuUGVyc29uUghkaXJlY3RvchIdCgpwb3N0ZXJfdXJsGAUgASgJUglwb3N0ZXJVcmwSHwoLdHJhaWxlcl91cmwYBiABKAlSCnRyYWlsZXJVcmwSIQoMcmVsZWFzZV95ZWFyGAcgASgDUgtyZWxlYXNlWWVhcg==');
@$core.Deprecated('Use movieRequestDescriptor instead')
const MovieRequest$json = const {
  '1': 'MovieRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `MovieRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List movieRequestDescriptor = $convert.base64Decode('CgxNb3ZpZVJlcXVlc3QSDgoCaWQYASABKANSAmlk');
@$core.Deprecated('Use listMoviesRequestDescriptor instead')
const ListMoviesRequest$json = const {
  '1': 'ListMoviesRequest',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 3, '10': 'ids'},
  ],
};

/// Descriptor for `ListMoviesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMoviesRequestDescriptor = $convert.base64Decode('ChFMaXN0TW92aWVzUmVxdWVzdBIQCgNpZHMYASADKANSA2lkcw==');
@$core.Deprecated('Use listMoviesResponseDescriptor instead')
const ListMoviesResponse$json = const {
  '1': 'ListMoviesResponse',
  '2': const [
    const {'1': 'movies', '3': 1, '4': 3, '5': 11, '6': '.movies.Movie', '10': 'movies'},
  ],
};

/// Descriptor for `ListMoviesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listMoviesResponseDescriptor = $convert.base64Decode('ChJMaXN0TW92aWVzUmVzcG9uc2USJQoGbW92aWVzGAEgAygLMg0ubW92aWVzLk1vdmllUgZtb3ZpZXM=');
