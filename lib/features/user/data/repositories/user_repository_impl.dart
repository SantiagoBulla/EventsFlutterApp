import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:events/core/connection/network_info.dart';
import 'package:events/core/errors/failure.dart';
import 'package:events/features/user/data/datasources/login_remote_data_source.dart';
import 'package:events/features/user/domain/entities/user_entity.dart';
import 'package:events/features/user/domain/params/user_params.dart';
import 'package:events/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserEntity>> getUserData(
      {required GetUserParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        // TODO implements code management
        final userData = await remoteDataSource.getUserDate(params: params);
        print(userData);
        return Right(userData);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: 'Error en Dio Exception'));
      }
    } else {
      return Left(NetWorkingFailure(
          errorMessage: 'Server Failure while validating user'));
    }
  }
}
