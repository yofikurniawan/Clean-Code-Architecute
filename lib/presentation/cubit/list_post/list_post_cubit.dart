// import 'dart:developer';

import 'package:bloc/bloc.dart';
// import 'package:clean_architecture/data/model/list_post_model.dart';
import 'package:clean_architecture/domain/entities/list_post_entity.dart';
import 'package:clean_architecture/domain/usecase/get_list_post.dart';
import 'package:equatable/equatable.dart';

part 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit(this.getListPost) : super(ListPostInitial());

  final GetListPost getListPost;

  getPostList() async {
      final result = await getListPost.fetchPostList();      
      result.fold((l) {
        emit(ListPostError(l.toString()));
      }, (r) {
        emit(ListPostLoaded(r, 'Data Berhasil didapatkan'));
      });
  }
}
