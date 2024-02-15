import 'package:dio/dio.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/features/user/domain/params/user_params.dart';

import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserDate({required GetUserParams params});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUserDate({required GetUserParams params}) async {
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
      final response = await dio.get('$baseUrl/user/${params.idUser}');
      return UserModel.fromJson(response.data);
  }
}
