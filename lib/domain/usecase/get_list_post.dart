import 'package:clean_architecture/domain/entities/list_post_entity.dart';
import 'package:clean_architecture/domain/respositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

class GetListPost {
  final RepositoriesDomain repositoriesDomain;

  GetListPost(this.repositoriesDomain);

  Future<Either<String, List<ListPostEntity>>> fetchPostList() {
    return repositoriesDomain.getListPost();
  }
}