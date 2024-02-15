import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:events/core/connection/network_info.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/user/data/datasources/user_remote_data_source.dart';
import 'package:events/features/user/data/repositories/user_repository_impl.dart';
import 'package:events/features/user/domain/entities/user_entity.dart';
import 'package:events/features/user/domain/params/user_params.dart';
import 'package:flutter/material.dart';

import '../../domain/usescases/user_actions.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? user;
  Failure? failure;

  UserProvider({
    this.user,
    this.failure,
  });

  void eitherFailureOrUserData({required GetUserParams params}) async {
    UserRepositoryImpl repository = UserRepositoryImpl(
      remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrToken =
        await UsersActions(repository).getUserData(params: params);

    failureOrToken.fold(
      (error) {
        failure = error;
        notifyListeners();
      },
      (userData) {
        user = userData;
        notifyListeners();
      },
    );
  }
}
