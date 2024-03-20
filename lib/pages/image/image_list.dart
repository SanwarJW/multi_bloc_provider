import 'package:flutter/material.dart';
import 'package:multi_bloc_provider/pages/image/bloc/image_list_bloc.dart';

class ImageList extends StatefulWidget {
  final ImageListBloc imageListBloc;
  const ImageList({super.key, required this.imageListBloc});

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  void initState() {
    super.initState();
    widget.imageListBloc.loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image List')),
      body: Center(
        child: StreamBuilder<List<String>>(
          stream: widget.imageListBloc.imageListStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data![index]);
                },
              );
            } else {
              // Handle the case when data is not available
              return const Text('No data available');
            }
          },
        ),
      ),
    );
  }
}
