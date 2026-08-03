import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubit/chatcubit.dart';
import '../cubit/chatstate.dart';
import '../model/chat_message.dart';

class ChatScreen extends StatelessWidget {
  final XFile? image;

  const ChatScreen({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(image: image),
      child: const ChatView(),
    );
  }
}

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<ChatCubit>();

      if (cubit.image != null) {
        cubit.sendImage(cubit.image!);
      }
    });
  }

  Widget buildMessage(Message message) {

    return Align(
      alignment: message.isUser
          ? Alignment.centerRight
          : Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: message.isUser
              ? Colors.green
              : Colors.grey.shade300,

          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            if(message.imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(message.imagePath!),
                  width: 220,
                ),
              ),


            if(message.text != null)
              Text(
                message.text!,
                style: TextStyle(
                  color: message.isUser
                      ? Colors.white
                      : Colors.black,
                ),
              )

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        final cubit = context.read<ChatCubit>();

        return Scaffold(
          appBar: AppBar(
            title: const Text("NutriSnap AI"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.messages.length,
                  itemBuilder: (context, index) {
                    return buildMessage(
                      cubit.messages[index],
                    );
                  },
                ),
              ),

              if (state is ChatLoading)
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [

                    IconButton(
                      onPressed: () {
                        cubit.pickImageFromGallery();
                      },
                      icon: const Icon(Icons.photo),
                    ),

                    Expanded(
                      child: TextField(
                        controller: cubit.controller,
                        decoration: InputDecoration(
                          hintText: "Type your message...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        cubit.sendMessage();
                      },
                      icon: const Icon(Icons.send),
                    ),

                  ],
                )
              ),
            ],
          ),
        );
      },
    );
  }
}