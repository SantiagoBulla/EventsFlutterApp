import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:events/core/connection/network_info.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/login/domain/entities/auth_entity.dart';
import 'package:events/features/user/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../../core/params/login_params.dart';
import '../../data/datasources/login_remote_data_source.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../domain/usecases/validate_login.dart';

class AuthProvider extends ChangeNotifier {
  String? id;
  Failure? failure;

  AuthProvider({
    this.id,
    this.failure,
  });

  Future<Map<String, dynamic>> eitherFailureOrValidateUser(
      {required LoginParams params}) async {
    LoginRepositoryImpl repository = LoginRepositoryImpl(
      remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrToken = await ValidateLogin(repository).call(params: params);
    print(failureOrToken);
    Map<String, dynamic> response = {'status': true, 'message': 'Validado'};

    failureOrToken.fold(
      (failure) {
        response = {'status': false, 'message': failure.errorMessage};
        notifyListeners();
      },
      (userData) {
        id = userData.id;
        notifyListeners();
      },
    );

    return response;
  }
}
