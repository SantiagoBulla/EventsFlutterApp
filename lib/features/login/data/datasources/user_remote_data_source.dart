import 'package:dio/dio.dart';
import 'package:events/features/login/data/models/AuthModel.dart';
import '../../../../core/params/login_params.dart';

abstract class UserRemoteDataSource {
  Future<AuthModel> validateUser({required LoginParams params});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<AuthModel> validateUser({required LoginParams params}) async {
    final response = await dio.post(
      'http://192.168.8.104:9000/api/auth/login',
      data: {
        'user': params.email,
        'password': params.password,
      },
    );
    return AuthModel.fromJson(response.data);
  }
}
