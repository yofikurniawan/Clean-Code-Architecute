import 'dart:developer';
// import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/common/enum_status.dart';
import 'package:clean_architecture/common/input_create_user_model.dart';
import 'package:clean_architecture/domain/usecase/get_create_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/create_user_entity.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit(this.getCreateUser) : super(CreateUserInitial());

  final GetCreateUser getCreateUser;

  static final firstName = TextEditingController();
  static final lastName = TextEditingController();
  static final email = TextEditingController();

  init(){
    emit(CreateUserLoaded(null, "Hit Initial Loaded", EnumStatus.empty));
  }

  getUserCreate(BuildContext context) async {
    log('First Name : ${firstName.text} and Last Name : ${lastName.text} and Email : ${email.text}');

    emit(CreateUserLoaded(null, "Loading", EnumStatus.loading));
    
    final input = InputCreateUserModel(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
    );

    final result = await getCreateUser.fetchCreateUser(input);
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal Membuat Akun'),
          duration: Duration(seconds: 2),
        ),
      );
      emit(CreateUserError(l.toString(), EnumStatus.error));  
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil Membuat Akun'),
          duration: Duration(seconds: 2),
        ),
      );
      emit(CreateUserLoaded(r, 'Data Berhasil didapatkan', EnumStatus.loaded));
    });
  }
}
