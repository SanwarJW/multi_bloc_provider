import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multi_bloc_provider/data.dart';

part 'image_list_event.dart';
part 'image_list_state.dart';

DataList dataList = DataList();

class ImageListBloc extends Bloc<ImageListEvent, ImageListState> {
  ImageListBloc() : super(ImageListInitial()) {}

  final _imageListController = StreamController<List<String>>.broadcast();
  Stream<List<String>> get imageListStream => _imageListController.stream;

  loadImages() async {
    if (!_imageListController.hasListener) {
      var dList = await dataList.gitListData();
      _imageListController.sink.add(dList);
    }
  }
}
