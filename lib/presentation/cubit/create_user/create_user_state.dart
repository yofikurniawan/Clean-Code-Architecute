part of 'create_user_cubit.dart';

sealed class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object> get props => [];
}

final class CreateUserInitial extends CreateUserState {}

class CreateUserLoaded extends CreateUserState {
  final CreateUserEntity? user;
  final String message;
  final EnumStatus enumStatus;

  const CreateUserLoaded(this.user, this.message, this.enumStatus);
}

class CreateUserError extends CreateUserState {
  final String message;
  final EnumStatus enumStatus;

  const CreateUserError(this.message, this.enumStatus);
}
