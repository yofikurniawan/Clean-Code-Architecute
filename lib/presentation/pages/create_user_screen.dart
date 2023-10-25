import 'dart:developer';

import 'package:clean_architecture/common/my_route.dart';
import 'package:clean_architecture/presentation/cubit/create_user/create_user_cubit.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/enum_status.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,

      ),
      body: BlocBuilder<CreateUserCubit, CreateUserState>(
        builder: (context, state) {
            if(state is CreateUserLoaded) {
              log('Data : ${state.user}');
              return Column(
                children: [
                  SizedBox(height: 20,),
                  Container( 
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: CreateUserCubit.firstName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'First Name',
                        hintStyle: TextStyle(fontSize: 16 ,color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: CreateUserCubit.lastName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Last Name',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: CreateUserCubit.email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed:  state.enumStatus != EnumStatus.loading ? () {
                        context.read<CreateUserCubit>().getUserCreate(context);
                      } : null,
                      child: state.enumStatus == EnumStatus.loading ? CircularProgressIndicator() : Text('Create User'),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoute.listPost);
                        // CreateUserCubit().getUserCreate(CreateUserCubit.firstName.text, CreateUserCubit.lastName.text, CreateUserCubit.email.text);
                      },
                      child: Text('Lihat Post'),
                    ),
                  ),

                ],
              );
            }else if(state is CreateUserError) {
              return Container(
                child: Text(state.message),
              );
            }
            return const CircularProgressIndicator();
        },
      ),
    );
  }
}