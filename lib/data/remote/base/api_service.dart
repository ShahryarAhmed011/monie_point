import 'dart:async';
import 'package:dio/dio.dart';
import '../exception/exception_factory.dart';
import 'dto_mapper.dart';

abstract class ApiService {
  final Dio dio;
  final RemoteExceptionFactory _remoteExceptionFactory;

  const ApiService({required this.dio})
      : _remoteExceptionFactory = const RemoteExceptionFactory();

  Future<D> executeWithResponse<D>(
      {required ApiCall remote,
      Map requestDto = const {},
      required RemoteMapper<D> mapper}) async {
    try {
      Response response = await remote(requestDto);
      return mapper.mapToData(response.data["data"]);
    } on DioError catch (error) {
      throw _remoteExceptionFactory.create(error);
    }
  }

  Future<D> executeWithExtraResponse<D>(
      {required ApiCall remote,
        Map requestDto = const {},
        required RemoteMapper<D> mapper}) async {
    try {
      Response response = await remote(requestDto);
      return mapper.mapToData(response.data);
    } on DioError catch (error) {
      throw _remoteExceptionFactory.create(error);
    }
  }

  Future execute({required ApiCall remote, Map requestDto = const {}}) async {
    try {
      Response response = await remote(requestDto);
      assert((response.statusCode ?? 0) ~/ 100 == 2);
    } on DioError catch (error) {
      throw _remoteExceptionFactory.create(error);
    }
  }
}

typedef ApiCall = Future<Response> Function(Map requestDto);
