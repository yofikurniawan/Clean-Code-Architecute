import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/usecase/get_detail_user.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/detail_user_entity.dart';

part 'detail_user_state.dart';

class DetailUserCubit extends Cubit<DetailUserState> {
  DetailUserCubit(this.getDetailUser) : super(DetailUserInitial());

  final GetDetailUser getDetailUser;

  getDetailUserList() async {
    final result = await getDetailUser.fetchGetDetailUser();
    result.fold((l) {
      emit(DetailUserError(l.toString()));
    }, (r) {
      emit(DetailUserLoaded(r, 'Data Berhasil didapatkan'));
    });
  }
}
