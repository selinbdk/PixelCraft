import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixelcraft/core/models/response/image_response_model.dart';
import 'package:pixelcraft/core/repository/image_storage_repository.dart';

part 'add_image_state.dart';

class AddImageCubit extends Cubit<AddImageState> {
  AddImageCubit(this._imageStorageRepository) : super(const AddImageInitial());

  Future<void> addImage(ImageResponseModel model) async {
    emit(const AddImageLoading());

    try {
      await _imageStorageRepository.saveResult(model.toCollection());
      emit(const AddImageSuccess());
    } catch (_) {
      emit(AddImageFailure(message: _.toString()));
    }
  }

  final ImageStorageRepository _imageStorageRepository;
}
