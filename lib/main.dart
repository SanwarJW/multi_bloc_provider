import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_provider/pages/home/home.dart';
import 'package:multi_bloc_provider/pages/image/bloc/image_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final imageListBloc = ImageListBloc();
    // ..loadImages(); // Instantiate and load images

    return BlocProvider.value(
      value: imageListBloc, // Pass the instance of ImageListBloc
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
