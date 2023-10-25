import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/usecase/get_list_comment.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/list_comment_entity.dart';

part 'list_comment_state.dart';

class ListCommentCubit extends Cubit<ListCommentState> {
  ListCommentCubit(this.getListComment) : super(ListCommentInitial());

  final GetListComment getListComment;

  getCommentList() async {
    final result = await getListComment.fetchCommentList();
    result.fold((l) {
      emit(ListCommentError(l.toString()));
    }, (r) {
      emit(ListCommentLoaded(r, 'Data Berhasil didapatkan'));
    });
  }

}
