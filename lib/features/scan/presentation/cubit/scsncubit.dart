import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

import 'package:menna/features/scan/presentation/cubit/scannarstate.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());

  late CameraController controller;

  bool isTakingPicture = false;

  Future<void> initializeCamera(List<CameraDescription> cameras) async {
    emit(CameraLoading());

    try {
      controller = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller.initialize();

      emit(CameraSuccess());
    } catch (e) {
      emit(CameraError(e.toString()));
    }
  }
  final ImagePicker picker = ImagePicker();

  Future<XFile?> pickImageFromGallery() async {
    return await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );
  }
  Future<XFile?> takePhoto() async {
    if (isTakingPicture) return null;

    try {
      isTakingPicture = true;

      if (!controller.value.isInitialized) {
        return null;
      }

      if (controller.value.isTakingPicture) {
        return null;
      }

      final XFile image = await controller.takePicture();

      return image;
    } catch (e) {
      emit(CameraError(e.toString()));
      return null;
    } finally {
      isTakingPicture = false;
    }
  }

  @override
  Future<void> close() async {
    await controller.dispose();
    return super.close();
  }
}