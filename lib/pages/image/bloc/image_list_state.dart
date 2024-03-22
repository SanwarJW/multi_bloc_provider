part of 'image_list_bloc.dart';

@immutable
sealed class ImageListState {}

final class ImageListInitialState extends ImageListState {}
final class ImageListLoadingState extends ImageListState {}

final class ImageListLoadedState extends ImageListState {
  final List<String> listData;
  ImageListLoadedState ({required this.listData});
}

final class ImageListErrorState extends ImageListState {}
