import 'package:dartz/dartz.dart';
import 'package:digital14_demo/data/failure.dart';
import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/domain/repositories/event_repository.dart';
import 'package:get_it/get_it.dart';

class GetEventsUseCase {
  final eventRepository = GetIt.I<EventRepository>();
  Future<Either<Failure, Events>> execute({String? query}) => eventRepository.getEvents(query);
}
