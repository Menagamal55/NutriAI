
abstract class CameraState {}

class CameraInitial extends CameraState {}

class CameraLoading extends CameraState {}

class CameraSuccess extends CameraState {}

class CameraError extends CameraState {
  final String error;

  CameraError(this.error);
}