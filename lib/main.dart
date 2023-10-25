// import 'package:bloc/bloc.dart';
import 'package:clean_architecture/common/my_route.dart';
import 'package:clean_architecture/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:clean_architecture/presentation/cubit/detail_user/detail_user_cubit.dart';
import 'package:clean_architecture/presentation/cubit/list_comment/list_comment_cubit.dart';
import 'package:clean_architecture/presentation/cubit/list_post/list_post_cubit.dart';
import 'package:clean_architecture/presentation/cubit/list_user/list_user_cubit.dart';
import 'package:clean_architecture/presentation/pages/create_user_screen.dart';
import 'package:clean_architecture/presentation/pages/list_post_screen.dart';
import 'package:flutter/material.dart';
import 'injection.dart' as git;
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  git.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => git.locator<CreateUserCubit>()..init()),
        BlocProvider(create: (_) => git.locator<DetailUserCubit>()),
        BlocProvider(create: (_) => git.locator<ListCommentCubit>()),
        BlocProvider(create: (_) => git.locator<ListPostCubit>()),
        BlocProvider(create: (_) => git.locator<ListUserCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CreateUserScreen(),
        initialRoute: '/',
        onGenerateRoute: (routes){
          switch(routes.name){
            case MyRoute.listPost:
              return MaterialPageRoute(builder: (_) => const ListPostScreen());
            default:
              return MaterialPageRoute(builder: (_) => Container (
                child: const Text('Page not found'),
              ));
          }
        },
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
