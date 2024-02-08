
import 'package:dio/dio.dart';
import 'package:events/features/login/data/models/user_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/params/login_params.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser({required LoginParams params});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUser({required LoginParams params}) async {
    print('bandera');
    final http = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 20000), // 5 segundos
      receiveTimeout: const Duration(milliseconds: 5000), // 5 segundos
    ));

    final response = await http.get('http://192.168.8.104:9000/api/events');


    print(response);

    throw ServerException();
    // if (response.statusCode == 200) {
    //   print(response.data[0]);
    //   return UserModel.fromJson(response.data[1]);
    // } else {
    //   throw ServerException();
    // }
  }
}
