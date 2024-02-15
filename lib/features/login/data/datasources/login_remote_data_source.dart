import 'package:dio/dio.dart';
import 'package:events/core/constants/constants.dart';
import 'package:events/features/login/data/models/AuthModel.dart';
import '../../../../core/params/login_params.dart';

abstract class LoginRemoteDataSource {
  Future<AuthModel> validateUser({required LoginParams params});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl({required this.dio});

  @override
  Future<AuthModel> validateUser({required LoginParams params}) async {
    final response = await dio.post(
      '$baseUrl/auth/login',
      data: {
        'user': params.email,
        'password': params.password,
      },
    );
    return AuthModel.fromJson(response.data);
  }
}
