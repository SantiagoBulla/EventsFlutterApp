import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/events/domain/entities/events_entity.dart';
import 'package:events/features/events/domain/params/events_params.dart';

abstract class EventsRepository {
  Future<Either<Failure, List<EventEntity>>> getEventsByUser(
      {required GetAllEventsByUser params});
}
