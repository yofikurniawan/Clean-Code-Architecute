import 'package:clean_architecture/domain/entities/detail_user_entity.dart';
import 'package:clean_architecture/domain/respositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

class GetDetailUser {
  final RepositoriesDomain repositoriesDomain;

  GetDetailUser(this.repositoriesDomain);

  Future<Either <String, DetailUserEntity>> fetchGetDetailUser() {
    return repositoriesDomain.getDetailUser();
  }
}