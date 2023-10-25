
// import 'dart:developer';

import 'package:clean_architecture/presentation/cubit/list_post/list_post_cubit.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injection.dart' as git;

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Post', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocProvider(
        create: (_) => git.locator<ListPostCubit>()..getPostList(),
        child: BlocBuilder<ListPostCubit, ListPostState>(
          builder: (context, state) {
            if(state is ListPostLoaded) {
              return Container(
                child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(state.length[index].image),
                        title: Text(state.length[index].text),
                        subtitle: Text(state.length[index].owner.firstName),
                      ),
                    );
                  },
                ),

              );
            } else if(state is ListPostError) {
              return Center(
                child: Text(state.message),
                // child: Text('Error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )
    );
  }
}