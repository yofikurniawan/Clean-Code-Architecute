part of 'list_post_cubit.dart';

sealed class ListPostState extends Equatable {
  const ListPostState();

  @override
  List<Object> get props => [];
}

final class ListPostInitial extends ListPostState {}

class ListPostLoaded extends ListPostState {
  final List<ListPostEntity> list;
  final String message;

  const ListPostLoaded(this.list, this.message);

  get length => null;

  // get listPost => null;
}

class ListPostError extends ListPostState {
  final String message;

  const ListPostError(this.message);

}
