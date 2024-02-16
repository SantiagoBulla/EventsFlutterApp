import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:events/core/connection/network_info.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/events/data/datasources/events_remote_data_source.dart';
import 'package:events/features/events/data/repositories/events_repository_Impl.dart';
import 'package:events/features/events/domain/entities/events_entity.dart';
import 'package:events/features/events/domain/params/events_params.dart';
import 'package:events/features/events/domain/usescases/events_actions.dart';
import 'package:flutter/cupertino.dart';

class EventsProvider extends ChangeNotifier {
  List<EventEntity>? eventsList;
  Failure? failure;

  EventsProvider({this.eventsList, this.failure});

  void eitherFailureOrEvents({required GetAllEventsByUser params}) async {
    EventRepositoryImpl repository = EventRepositoryImpl(
      remoteDataSource: EventRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrEvents = await EventsActions(repository: repository)
        .getEventsByUser(params: params);

    failureOrEvents.fold(
      (error) {
        failure = error;
        notifyListeners();
      },
      (events) {
        eventsList = events;
        notifyListeners();
      },
    );
  }
}
