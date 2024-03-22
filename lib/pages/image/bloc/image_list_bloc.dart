import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multi_bloc_provider/data.dart';

part 'image_list_event.dart';
part 'image_list_state.dart';

DataList dataList = DataList();

class ImageListBloc extends Bloc<ImageListInitialEvent, ImageListState> {
  ImageListBloc() : super(ImageListLoadingState()) {
    on<ImageListInitialEvent>(imageListInitialEvent);
  }
  List<String> dList = [];
  Future<FutureOr<void>> imageListInitialEvent(
      ImageListInitialEvent event, Emitter<ImageListState> emit) async {
    emit(ImageListLoadingState());
    if (dList.isEmpty) {
      dList = await dataList.gitListData();
    }
    emit(ImageListLoadedState(listData: dList));
  }

  loadImages() async {
    dList = await dataList.gitListData();
  }
}
