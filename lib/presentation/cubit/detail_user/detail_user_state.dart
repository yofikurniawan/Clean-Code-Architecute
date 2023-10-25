part of 'detail_user_cubit.dart';

sealed class DetailUserState extends Equatable {
  const DetailUserState();

  @override
  List<Object> get props => [];
}

final class DetailUserInitial extends DetailUserState {}

class DetailUserLoaded extends DetailUserState {
  final DetailUserEntity user;
  final String message;

  const DetailUserLoaded(this.user, this.message);
}

class DetailUserError extends DetailUserState {
  final String message;

  const DetailUserError(this.message);
}
