import 'package:dio/dio.dart';
import 'package:events/features/events/data/models/events_model.dart';
import 'package:events/features/events/domain/params/events_params.dart';

import '../../../../core/constants/constants.dart';

abstract class EventRemoteDataSource {
  Future<List<EventModel>> getEventsByUser({required GetAllEventsByUser params});
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  final Dio dio;

  EventRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<EventModel>> getEventsByUser(
      {required GetAllEventsByUser params}) async {
    void setupDio(String token) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            // Agrega el encabezado de autorización a la solicitud
            options.headers['Authorization'] = 'Bearer $token';
            return handler.next(options);
          },
        ),
      );
    }

    setupDio(params.token);
    final response = await dio.get('$baseUrl/events/${params.idUserFK}');
    final List<EventModel> lista = List.from(
      response.data.map((eventData) => EventModel.fromJson(eventData)),
    );
    return lista;
  }
}
