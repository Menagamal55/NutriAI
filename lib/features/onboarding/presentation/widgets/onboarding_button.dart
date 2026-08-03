import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';


class OnboardingButton extends StatelessWidget {


final String text;
final VoidCallback onTap;


const OnboardingButton({
super.key,
required this.text,
required this.onTap,
});



@override
Widget build(BuildContext context) {


return SizedBox(

width:
double.infinity,


height:
55,


child:

ElevatedButton(

onPressed:
onTap,


style:
ElevatedButton.styleFrom(

backgroundColor:
AppColors.primary,


shape:
RoundedRectangleBorder(

borderRadius:
BorderRadius.circular(18),

),

),


child:

Text(

text,

style:
const TextStyle(

color:
Colors.white,

fontSize:
16,

fontWeight:
FontWeight.w600,

),

),

),

);

}

}