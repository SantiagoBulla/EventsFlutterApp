import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/events/domain/entities/events_entity.dart';
import 'package:events/features/events/domain/params/events_params.dart';
import 'package:events/features/events/domain/repositories/events_repository.dart';

class EventsActions {
  final EventsRepository repository;

  EventsActions({required this.repository});

  Future<Either<Failure, List<EventEntity>>> getEventsByUser(
      {required GetAllEventsByUser params}) {
    return repository.getEventsByUser(params: params);
  }
}
