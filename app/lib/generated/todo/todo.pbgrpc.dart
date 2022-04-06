///
//  Generated code. Do not modify.
//  source: todo/todo.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'todo.pb.dart' as $0;
export 'todo.pb.dart';

class TodoListClient extends $grpc.Client {
  static final _$addTodo =
      $grpc.ClientMethod<$0.AddTodoRequest, $0.AddTodoReply>(
          '/TodoList/AddTodo',
          ($0.AddTodoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AddTodoReply.fromBuffer(value));
  static final _$getTodo =
      $grpc.ClientMethod<$0.GetTodoRequest, $0.GetTodoReply>(
          '/TodoList/GetTodo',
          ($0.GetTodoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetTodoReply.fromBuffer(value));
  static final _$editTodo =
      $grpc.ClientMethod<$0.EditTodoRequest, $0.EditTodoReply>(
          '/TodoList/EditTodo',
          ($0.EditTodoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.EditTodoReply.fromBuffer(value));
  static final _$removeTodo =
      $grpc.ClientMethod<$0.RemoveTodoRequest, $0.RemoveTodoReply>(
          '/TodoList/RemoveTodo',
          ($0.RemoveTodoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RemoveTodoReply.fromBuffer(value));

  TodoListClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AddTodoReply> addTodo($0.AddTodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTodoReply> getTodo($0.GetTodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.EditTodoReply> editTodo($0.EditTodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editTodo, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveTodoReply> removeTodo(
      $0.RemoveTodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTodo, request, options: options);
  }
}

abstract class TodoListServiceBase extends $grpc.Service {
  $core.String get $name => 'TodoList';

  TodoListServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddTodoRequest, $0.AddTodoReply>(
        'AddTodo',
        addTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddTodoRequest.fromBuffer(value),
        ($0.AddTodoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTodoRequest, $0.GetTodoReply>(
        'GetTodo',
        getTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTodoRequest.fromBuffer(value),
        ($0.GetTodoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditTodoRequest, $0.EditTodoReply>(
        'EditTodo',
        editTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditTodoRequest.fromBuffer(value),
        ($0.EditTodoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveTodoRequest, $0.RemoveTodoReply>(
        'RemoveTodo',
        removeTodo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveTodoRequest.fromBuffer(value),
        ($0.RemoveTodoReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.AddTodoReply> addTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddTodoRequest> request) async {
    return addTodo(call, await request);
  }

  $async.Future<$0.GetTodoReply> getTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetTodoRequest> request) async {
    return getTodo(call, await request);
  }

  $async.Future<$0.EditTodoReply> editTodo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EditTodoRequest> request) async {
    return editTodo(call, await request);
  }

  $async.Future<$0.RemoveTodoReply> removeTodo_Pre($grpc.ServiceCall call,
      $async.Future<$0.RemoveTodoRequest> request) async {
    return removeTodo(call, await request);
  }

  $async.Future<$0.AddTodoReply> addTodo(
      $grpc.ServiceCall call, $0.AddTodoRequest request);
  $async.Future<$0.GetTodoReply> getTodo(
      $grpc.ServiceCall call, $0.GetTodoRequest request);
  $async.Future<$0.EditTodoReply> editTodo(
      $grpc.ServiceCall call, $0.EditTodoRequest request);
  $async.Future<$0.RemoveTodoReply> removeTodo(
      $grpc.ServiceCall call, $0.RemoveTodoRequest request);
}
