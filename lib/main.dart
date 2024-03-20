import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_provider/pages/home/bloc/home_bloc.dart';
import 'package:multi_bloc_provider/pages/home/home.dart';
import 'package:multi_bloc_provider/pages/image/bloc/image_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   '/imageList': (context) => const ImageList(),
      // },
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
          BlocProvider<ImageListBloc>(create: (context) => ImageListBloc()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
