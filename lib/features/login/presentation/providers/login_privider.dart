import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:events/core/connection/network_info.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/login/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/connection/dio_base_options.dart';
import '../../../../core/params/login_params.dart';
import '../../data/datasources/user_remote_data_source.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../domain/usecases/validate_login.dart';

class AuthProvider extends ChangeNotifier {
  UserEntity? user;
  Failure? failure;

  AuthProvider({
    this.user,
    this.failure,
  });

  void eitherFailureOrValidateUser({required LoginParams params}) async {
    LoginRepositoryImpl repository = LoginRepositoryImpl(
      remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrUser = await ValidateLogin(repository).call(params: params);

    failureOrUser.fold(
      (newFailure) {
        user = null;
        failure = newFailure;
        notifyListeners();
      },
      (userData) {
        user = userData;
        failure = null;
        notifyListeners();
      },
    );
  }
}
