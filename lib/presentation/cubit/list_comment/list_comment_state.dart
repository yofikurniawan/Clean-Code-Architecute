part of 'list_comment_cubit.dart';

sealed class ListCommentState extends Equatable {
  const ListCommentState();

  @override
  List<Object> get props => [];
}

final class ListCommentInitial extends ListCommentState {}

class ListCommentLoaded extends ListCommentState {
  final List<ListCommentEntity> list;
  final String message;

  const ListCommentLoaded(this.list, this.message);
}

class ListCommentError extends ListCommentState {
  final String message;

  const ListCommentError(this.message);
}