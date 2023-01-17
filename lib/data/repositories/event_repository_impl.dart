import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:digital14_demo/data/datasource/event_remote_datasource.dart';
import 'package:digital14_demo/data/failure.dart';
import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/data/server_exception.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final remoteDataSource = GetIt.I<RemoteDataSource>();

  @override
  Future<Either<Failure, Events>> getEvents(String? query) async {
    try {
      //actual query
      final result = await remoteDataSource.getEvents(query);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure('connection failure'));
    } on ServerException {
      return const Left(ServerFailure('server failure'));
    }
  }
}
