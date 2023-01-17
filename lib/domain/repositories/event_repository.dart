//Repository contract
import 'package:dartz/dartz.dart';
import 'package:digital14_demo/data/failure.dart';
import 'package:digital14_demo/data/models/event_model.dart';

abstract class EventRepository {
  Future<Either<Failure, Events>> getEvents(String? query);
}
