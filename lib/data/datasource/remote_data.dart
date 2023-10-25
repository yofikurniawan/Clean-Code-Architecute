import 'package:clean_architecture/common/input_create_user_model.dart';
import 'package:clean_architecture/data/model/create_user_model.dart';
import 'package:clean_architecture/data/model/detail_user_model.dart';
import 'package:clean_architecture/data/model/list_comment_modal.dart';
import 'package:clean_architecture/data/model/list_post_model.dart';
import 'package:clean_architecture/data/model/list_user_model.dart';

abstract class RemoteData {
  Future<List<ListUserModel>> listUserModel();
  Future<List<ListPostModel>> listPostModel();
  Future<List<ListCommentModel>> listCommentModel();
  Future<DetailUserModel> detailUserModel();
  Future<CreateUserModel> createUserModel(InputCreateUserModel icum);
}