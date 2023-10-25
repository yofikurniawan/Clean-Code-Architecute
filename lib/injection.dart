// import 'package:clean_architecture/data/datasource/remote_data.dart';
import 'package:clean_architecture/data/repositories/repository_domain_implement.dart';
import 'package:clean_architecture/domain/respositories/repositories_domain.dart';
import 'package:clean_architecture/domain/usecase/get_detail_user.dart';
import 'package:clean_architecture/domain/usecase/get_list_comment.dart';
import 'package:clean_architecture/domain/usecase/get_list_post.dart';
import 'package:clean_architecture/domain/usecase/get_list_user.dart';
import 'package:clean_architecture/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:clean_architecture/presentation/cubit/detail_user/detail_user_cubit.dart';
import 'package:clean_architecture/presentation/cubit/list_comment/list_comment_cubit.dart';
import 'package:clean_architecture/presentation/cubit/list_post/list_post_cubit.dart';
import 'package:clean_architecture/presentation/cubit/list_user/list_user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';


import 'data/repositories/remote_data_implement.dart';
import 'domain/usecase/get_create_user.dart';

final locator = GetIt.instance;

void initialize(){

  // Repository Domain Implementation
  locator.registerFactory<RepositoriesDomain>(() => RepositoryDomainImplements(locator()));

// Repoistory Remore Data Implementation
  locator.registerFactory(() => RemoteDataImplement(locator()));

  // use case
  locator.registerFactory(() => GetCreateUser(locator()));
  locator.registerFactory(() => GetDetailUser(locator()));
  locator.registerFactory(() => GetListComment(locator()));
  locator.registerFactory(() => GetListPost(locator()));
  locator.registerFactory(() => GetListUser(locator()));

  // State Management Cubit
  locator.registerFactory(() => CreateUserCubit(locator()));
  locator.registerFactory(() => DetailUserCubit(locator()));
  locator.registerFactory(() => ListCommentCubit(locator()));
  locator.registerFactory(() => ListPostCubit(locator()));
  locator.registerFactory(() => ListUserCubit(locator()));

  // external Library
  locator.registerFactory(() => Client());
}