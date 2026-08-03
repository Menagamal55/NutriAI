import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../chatbot/screens/chat_screen.dart';
import '../cubit/scannarstate.dart';
import '../cubit/scsncubit.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = CameraCubit();
        availableCameras().then((cameras) {
          if (cameras.isNotEmpty) {
            cubit.initializeCamera(cameras);
          }
        });
        return cubit;
      },
      child: const CameraView(),
    );
  }
}

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<CameraCubit, CameraState>(
        builder: (context, state) {
          final cubit = context.read<CameraCubit>();

          if (state is CameraLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CameraError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          if (state is! CameraSuccess) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [


              CameraPreview(cubit.controller),
              Positioned(
                bottom: 40,
                left: 30,
                child: IconButton(
                onPressed: () async {
          XFile? image = await cubit.pickImageFromGallery();

          if (image != null) {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (_) => ChatScreen(
          image: image,
          ),
          ),
          );
          }
          },

                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
              Align(

                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: InkWell(
                    onTap: () async {
                      XFile? image = await cubit.takePhoto();

                      if (image != null) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(
                              image: image,
                            ),
                          ),
                        );

                      }
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
          CameraPreview(cubit.controller);
        },
      ),
    );
  }
}