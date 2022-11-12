part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class LoadingImage extends ImageState {}

class ErrorNetImage extends ImageState {
  String? error;
  ErrorNetImage(this.error);
}

class SuccessedImage extends ImageState {
  String? urlimage;
  SuccessedImage(this.urlimage);
}
