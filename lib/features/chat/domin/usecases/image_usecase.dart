import 'package:dartz/dartz.dart';

import '../../../../core/error/error_type.dart';
import '../repository/chat_repositry.dart';

class ImageUsecase {
  final ChatRepditry chatRepditry;

  ImageUsecase({required this.chatRepditry});
  Future<Either<ErrorType, String>> call(int id) async {
    return await chatRepditry.image(id);
  }
}
