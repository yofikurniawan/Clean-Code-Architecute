import 'package:clean_architecture/common/input_create_user_model.dart';
import 'package:clean_architecture/data/repositories/remote_data_implement.dart';
import 'package:clean_architecture/domain/entities/create_user_entity.dart';
import 'package:clean_architecture/domain/entities/detail_user_entity.dart';
import 'package:clean_architecture/domain/entities/list_comment_entity.dart';
import 'package:clean_architecture/domain/entities/list_post_entity.dart';
import 'package:clean_architecture/domain/entities/list_user_entity.dart';
import 'package:clean_architecture/domain/respositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

class RepositoryDomainImplements implements RepositoriesDomain {

  final RemoteDataImplement remoteDataImplement;

  RepositoryDomainImplements(this.remoteDataImplement);

  @override
  Future<Either<String, CreateUserEntity>> getCreateUser(InputCreateUserModel icum) async {
    try {
      final result = await remoteDataImplement.createUserModel(icum);
      return Right(result.toEntity());
    }catch(e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, DetailUserEntity>> getDetailUser() async {
    try {
      final result = await remoteDataImplement.detailUserModel();
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ListCommentEntity>>> getListComment() async {
    try {
      final result = await remoteDataImplement.listCommentModel();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  
  Future<Either<String, List<ListPostEntity>>> getListPost() async {
    try {
      final result = await remoteDataImplement.listPostModel();
      // print(result);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ListUserEntity>>> getListUser() async {
    try {
      final result = await remoteDataImplement.listUserModel();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

}