import 'package:clean_architecture/domain/entities/list_comment_entity.dart';
import 'package:clean_architecture/domain/respositories/repositories_domain.dart';
import 'package:dartz/dartz.dart';

class GetListComment{
  final RepositoriesDomain repositoriesDomain;

  GetListComment(this.repositoriesDomain);

  Future<Either<String, List<ListCommentEntity>>> fetchCommentList(){
    return repositoriesDomain.getListComment();
  }
}