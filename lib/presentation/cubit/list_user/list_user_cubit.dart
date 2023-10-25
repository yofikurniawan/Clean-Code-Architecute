import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/usecase/get_list_user.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/list_user_entity.dart';

part 'list_user_state.dart';

class ListUserCubit extends Cubit<ListUserState> {
  ListUserCubit(this.getListUser) : super(ListUserInitial());

  final GetListUser getListUser;

  getListUserList() async {
    final result = await getListUser.fetchUserList();
    result.fold(
      (l) => emit(ListUserError(l.toString())),
      (r) => emit(ListUserLoaded(r, 'Data Berhasil didapatkan')),
    );
  }
}
