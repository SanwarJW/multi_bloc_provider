import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_provider/pages/image/bloc/image_list_bloc.dart';

class ImageList extends StatefulWidget {
  const ImageList({
    super.key,
  });

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  void initState() {
    super.initState();
    final imageListBloc = BlocProvider.of<ImageListBloc>(context);
    imageListBloc.add(ImageListInitialEvent());
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Image List')),
  //     body: Center(
  //       child: StreamBuilder<List<String>>(
  //         stream: widget.imageListBloc.imageListStream,
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return const CircularProgressIndicator();
  //           }
  //           if (snapshot.hasError) {
  //             return Text('Error: ${snapshot.error}');
  //           }
  //           if (snapshot.hasData) {
  //             return ListView.builder(
  //               itemCount: snapshot.data!.length,
  //               itemBuilder: (context, index) {
  //                 return Text(snapshot.data![index]);
  //               },
  //             );
  //           } else {
  //             // Handle the case when data is not available
  //             return const Text('No data available');
  //           }
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image List')),
      body: BlocBuilder<ImageListBloc, ImageListState>(
        buildWhen: (old, current) {
          return current is ImageListLoadingState ||
              current is ImageListLoadedState ||
              current is ImageListErrorState;
        },
        builder: (context, state) {
          if (state is ImageListLoadingState) {
            return const CircularProgressIndicator();
          }

          if (state is ImageListErrorState) {
            return const Text('Error');
          }

          if (state is ImageListLoadedState) {
            return ListView.builder(
              itemCount: (state).listData.length,
              itemBuilder: (context, index) {
                return Text((state).listData[index]);
              },
            );
          }

          return const Text('No data available');
        },
      ),
    );
  }
}
