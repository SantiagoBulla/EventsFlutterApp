import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:events/core/connection/network_info.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/events/data/datasources/events_remote_data_source.dart';
import 'package:events/features/events/domain/entities/events_entity.dart';
import 'package:events/features/events/domain/params/events_params.dart';
import 'package:events/features/events/domain/repositories/events_repository.dart';

class EventRepositoryImpl implements EventsRepository {
  final EventRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<EventEntity>>> getEventsByUser(
      {required GetAllEventsByUser params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final eventsDart =
            await remoteDataSource.getEventsByUser(params: params);
        return Right(eventsDart);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(ServerFailure(errorMessage: 'Error'));
    }
  }
}
