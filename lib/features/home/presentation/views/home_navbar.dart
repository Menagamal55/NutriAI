import 'package:flutter/material.dart';


import '../../../chatbot/screens/chat_screen.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../scan/presentation/screens/scan_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_view.dart';


class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}


class _MainHomeViewState extends State<MainHomeView> {

  int currentIndex = 0;


  Widget getPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();

      case 1:
        return const ChatScreen();

      case 2:
        return const CameraScreen();

      case 3:
        return const ProfileView();

      default:
        return const HomeView();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: getPage(currentIndex),


      bottomNavigationBar: CustomBottomNavBar(

        currentIndex: currentIndex,

        onTap: (index){

          setState(() {

            currentIndex = index;

          });

        },

      ),

    );
  }
}