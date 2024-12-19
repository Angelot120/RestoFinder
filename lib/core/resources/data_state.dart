// Gestion d'erreur réseau

import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;

  final DioError? error;

  const DataState({this.data, this.error});

  DataState.success(this.data) : error = null;
  DataState.failure(this.error) : data = null as T;
}

// Cas de succès

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

// Cas de d'échec

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError error) : super(error: error);
}
