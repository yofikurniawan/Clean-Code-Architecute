part of 'list_user_cubit.dart';

sealed class ListUserState extends Equatable {
  const ListUserState();

  @override
  List<Object> get props => [];
}

final class ListUserInitial extends ListUserState {}

class ListUserLoaded extends ListUserState {
  final List<ListUserEntity> list;
  final String message;

  const ListUserLoaded(this.list, this.message);
}

class ListUserError extends ListUserState {
  final String message;

  const ListUserError(this.message);
}
