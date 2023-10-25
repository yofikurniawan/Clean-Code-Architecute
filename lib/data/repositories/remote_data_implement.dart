import 'dart:convert';
import 'dart:developer';

import 'package:clean_architecture/common/constat.dart';
import 'package:clean_architecture/common/input_create_user_model.dart';
import 'package:clean_architecture/data/datasource/remote_data.dart';
import 'package:clean_architecture/data/model/create_user_model.dart';
import 'package:clean_architecture/data/model/detail_user_model.dart';
import 'package:clean_architecture/data/model/list_comment_modal.dart';
import 'package:clean_architecture/data/model/list_post_model.dart';
import 'package:clean_architecture/data/model/list_user_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataImplement implements RemoteData {
  final http.Client client;

  RemoteDataImplement(this.client);

  @override
  Future<CreateUserModel> createUserModel(InputCreateUserModel icum) async {
    final request =
        await http.post(Uri.parse("${Constant.baseUrl}user/create"), headers: {
      "app-id": Constant.apiKey,
    }, body: {
      "firstName": icum.firstName,
      "lastName": icum.lastName,
      "email": icum.email,
    });

    final response = jsonDecode(request.body);
    log("log user : $response");

    return CreateUserModel.fromJson(response);
  }

  @override
  Future<DetailUserModel> detailUserModel() async {
    final request = await http.get(
      Uri.parse('${Constant.baseUrl}user/60d0fe4f5311236168a109ca'),
      headers: {"app-id": Constant.apiKey},
    );
    final response = jsonDecode(request.body);
    return DetailUserModel.fromJson(response);
  }

  @override
  Future<List<ListCommentModel>> listCommentModel() async {
    final request = await http.get(
      Uri.parse('${Constant.baseUrl}comment?page=1&limit=10'),
      headers: {"app-id": Constant.apiKey},
    );

    final response = jsonDecode(request.body);
    final List data = response['data'];
    return data.map((e) => ListCommentModel.fromJson(e)).toList();
  }

  @override
  Future<List<ListPostModel>> listPostModel() async {
    final request = await http.get(Uri.parse('${Constant.baseUrl}post?page=1&limit=10'),
        headers: {"app-id": Constant.apiKey},
    );

    final response = jsonDecode(request.body);
    final List data = response['data'];
    log("log data : $data");
    return data.map((e) => ListPostModel.fromJson(e)).toList();
  }

  @override
  Future<List<ListUserModel>> listUserModel() async {
    final request = await http.get(
      Uri.parse('${Constant.baseUrl}user?page=1&limit=10'),
      headers: {"app-id": Constant.apiKey},
    );

    final response = jsonDecode(request.body);
    final List data = response['data'];
    return data.map((e) => ListUserModel.fromJson(e)).toList();
  }
}
