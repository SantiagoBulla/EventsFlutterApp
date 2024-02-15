import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:events/core/connection/network_info.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/user/data/datasources/login_remote_data_source.dart';
import 'package:events/features/user/data/repositories/user_repository_impl.dart';
import 'package:events/features/user/domain/params/user_params.dart';
import 'package:flutter/material.dart';

import '../../domain/usescases/user_actions.dart';

class UserProvider extends ChangeNotifier {
  String? id;
  Failure? failure;

  UserProvider({
    this.id,
    this.failure,
  });

  Future<Map<String, dynamic>> eitherFailureOrUserData(
      {required GetUserParams params}) async {
    UserRepositoryImpl repository = UserRepositoryImpl(
      remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrToken = await UsersActions(repository).getUserData(params: params);
    Map<String, dynamic> response = {'status': true, 'message': 'Validado'};

    print(response);

    return response;
  }
}
