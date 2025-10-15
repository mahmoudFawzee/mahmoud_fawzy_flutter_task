import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:mahmoudfawzy_flutter_task/core/errors/failures.dart';

typedef AsyncMethod<T> = Future<T> Function();

final class ExceptionsHandlerWrapper {
  static Future<Either<Failure, T>> call<T>(AsyncMethod<T> method) async {
    try {
      return Right(await method());
    } catch (e, stack) {
      log('$stack');
      return Left(Failure(e.toString()));
    }
  }
}
