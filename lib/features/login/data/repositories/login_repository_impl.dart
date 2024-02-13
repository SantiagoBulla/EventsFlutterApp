import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:events/core/errors/failure.dart';

import 'package:events/core/params/login_params.dart';
import 'package:events/features/login/data/datasources/user_remote_data_source.dart';
import 'package:events/features/login/domain/entities/auth_entity.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/connection/network_info.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, AuthEntity>> validateUser(
      {required LoginParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final userValidation = await remoteDataSource.validateUser(params: params);
        const storage = FlutterSecureStorage();
        await storage.write(key: userValidation.id, value: userValidation.token);
        return Right(userValidation);
      } on DioException catch (e){
        return Left(ServerFailure(
            errorMessage: e.response?.data['message']));
      }
    } else {
      return Left(
          NetWorkingFailure(errorMessage: 'Server Failure while validating user'));
    }
  }
}