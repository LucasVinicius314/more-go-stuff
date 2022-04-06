///
//  Generated code. Do not modify.
//  source: todo/todo.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use addTodoRequestDescriptor instead')
const AddTodoRequest$json = const {
  '1': 'AddTodoRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `AddTodoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTodoRequestDescriptor = $convert.base64Decode('Cg5BZGRUb2RvUmVxdWVzdBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGAoHY29udGVudBgCIAEoCVIHY29udGVudA==');
@$core.Deprecated('Use addTodoReplyDescriptor instead')
const AddTodoReply$json = const {
  '1': 'AddTodoReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AddTodoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTodoReplyDescriptor = $convert.base64Decode('CgxBZGRUb2RvUmVwbHkSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');
@$core.Deprecated('Use getTodoRequestDescriptor instead')
const GetTodoRequest$json = const {
  '1': 'GetTodoRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetTodoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTodoRequestDescriptor = $convert.base64Decode('Cg5HZXRUb2RvUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use getTodoReplyDescriptor instead')
const GetTodoReply$json = const {
  '1': 'GetTodoReply',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'createdAt', '3': 4, '4': 1, '5': 9, '10': 'createdAt'},
    const {'1': 'updatedAt', '3': 5, '4': 1, '5': 9, '10': 'updatedAt'},
  ],
};

/// Descriptor for `GetTodoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTodoReplyDescriptor = $convert.base64Decode('CgxHZXRUb2RvUmVwbHkSDgoCaWQYASABKAlSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIYCgdjb250ZW50GAMgASgJUgdjb250ZW50EhwKCWNyZWF0ZWRBdBgEIAEoCVIJY3JlYXRlZEF0EhwKCXVwZGF0ZWRBdBgFIAEoCVIJdXBkYXRlZEF0');
@$core.Deprecated('Use editTodoRequestDescriptor instead')
const EditTodoRequest$json = const {
  '1': 'EditTodoRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `EditTodoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editTodoRequestDescriptor = $convert.base64Decode('Cg9FZGl0VG9kb1JlcXVlc3QSDgoCaWQYASABKAlSAmlkEhQKBXRpdGxlGAIgASgJUgV0aXRsZRIYCgdjb250ZW50GAMgASgJUgdjb250ZW50');
@$core.Deprecated('Use editTodoReplyDescriptor instead')
const EditTodoReply$json = const {
  '1': 'EditTodoReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `EditTodoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editTodoReplyDescriptor = $convert.base64Decode('Cg1FZGl0VG9kb1JlcGx5EhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use removeTodoRequestDescriptor instead')
const RemoveTodoRequest$json = const {
  '1': 'RemoveTodoRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `RemoveTodoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeTodoRequestDescriptor = $convert.base64Decode('ChFSZW1vdmVUb2RvUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use removeTodoReplyDescriptor instead')
const RemoveTodoReply$json = const {
  '1': 'RemoveTodoReply',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RemoveTodoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeTodoReplyDescriptor = $convert.base64Decode('Cg9SZW1vdmVUb2RvUmVwbHkSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');
