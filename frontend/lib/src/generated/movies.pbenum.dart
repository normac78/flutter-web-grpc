///
//  Generated code. Do not modify.
//  source: movies.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RequestStatus_StatusCode extends $pb.ProtobufEnum {
  static const RequestStatus_StatusCode SUCCESS = RequestStatus_StatusCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUCCESS');
  static const RequestStatus_StatusCode FAILED = RequestStatus_StatusCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED');

  static const $core.List<RequestStatus_StatusCode> values = <RequestStatus_StatusCode> [
    SUCCESS,
    FAILED,
  ];

  static final $core.Map<$core.int, RequestStatus_StatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RequestStatus_StatusCode? valueOf($core.int value) => _byValue[value];

  const RequestStatus_StatusCode._($core.int v, $core.String n) : super(v, n);
}

