import 'package:dartz/dartz.dart';

import 'package:events/core/errors/failure.dart';

import 'package:events/core/params/login_params.dart';
import 'package:events/features/login/data/datasources/user_remote_data_source.dart';

import 'package:events/features/login/domain/entities/user_entity.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserEntity>> validateUser(
      {required LoginParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final user = await remoteDataSource.getUser(params: params);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure(
            errorMessage: 'Server Failure while validating user'));
      }
    } else {
      return Left(
          NetWorkingFailure(errorMessage: 'Server Failure while validating user'));
    }
  }
}
