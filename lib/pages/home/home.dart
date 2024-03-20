import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_provider/pages/image/bloc/image_list_bloc.dart';
import 'package:multi_bloc_provider/pages/image/image_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final imageListBloc = BlocProvider.of<ImageListBloc>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageList(
                            imageListBloc: imageListBloc,
                          )));
            },
            child: const Text('Go to Image List'),
          ),
        ));
  }
}
