import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTap;


  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {

    return CircleNavBar(

      activeIcons: const [

        Icon(
          Icons.home_rounded,
          color: Colors.white,
        ),


        Icon(
          Icons.chat_rounded,
          color: Colors.white,
        ),


        Icon(
          Icons.document_scanner_rounded,
          color: Colors.white,
        ),


        Icon(
          Icons.person_rounded,
          color: Colors.white,
        ),

      ],



      inactiveIcons: const [

        Icon(
          Icons.home_outlined,
        ),


        Icon(
          Icons.chat_outlined,
        ),


        Icon(
          Icons.camera_alt_rounded,
        ),


        Icon(
          Icons.person_outline,
        ),

      ],



      color: Colors.white,


      circleColor: const Color(0xff4CAF50),


      height: 70,


      circleWidth: 55,


      activeIndex: currentIndex,


      onTap: onTap,


      padding: const EdgeInsets.only(

        left: 12,

        right: 12,

        bottom: 12,

      ),


      cornerRadius: BorderRadius.circular(30),


      shadowColor: Colors.black12,


      elevation: 8,

    );

  }
}