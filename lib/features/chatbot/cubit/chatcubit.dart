import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


import '../model/chat_message.dart';
import '../services/apiservice.dart';
import 'chatstate.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({this.image}) : super(ChatInitial());

  final ApiService apiService = ApiService();

  final TextEditingController controller = TextEditingController();

  final List<Message> messages = [];

  final XFile? image;

  final String sessionId = DateTime.now().millisecondsSinceEpoch.toString();

  /// إرسال رسالة نصية
  Future<void> sendMessage() async {
    if (controller.text.trim().isEmpty) return;

    String userMessage = controller.text;

    messages.add(
      Message(
        text: userMessage,
        isUser: true,
      ),
    );

    controller.clear();

    emit(ChatLoading());

    try {
      String reply =
      await apiService.sendMessage(userMessage, sessionId);

      messages.add(
        Message(
          text: reply,
          isUser: false,
        ),
      );

      emit(ChatSuccess());
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
  final ImagePicker picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (image != null) {
      await sendImage(image);
    }
  }

  /// استقبال الصورة من الكاميرا
  Future<void> sendImage(XFile image) async {

    messages.add(
      Message(
        imagePath: image.path,
        isUser: true,
      ),
    );

    emit(ChatLoading());

    try {

      String reply = await apiService.sendImage(
        image,
        sessionId,
      );

      messages.add(
        Message(
          text: reply,
          isUser: false,
        ),
      );

      emit(ChatSuccess());

    } catch (e) {

      emit(ChatError(e.toString()));

    }
  }
}