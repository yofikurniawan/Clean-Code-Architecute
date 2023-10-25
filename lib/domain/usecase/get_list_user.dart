import 'package:clean_architecture/domain/entities/list_user_entity.dart';
import 'package:clean_architecture/domain/respositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

class GetListUser{
  final RepositoriesDomain repositoriesDomain;

  GetListUser(this.repositoriesDomain);

  Future<Either<String, List<ListUserEntity>>> fetchUserList(){
    return repositoriesDomain.getListUser();
  }
}