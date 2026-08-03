import 'package:flutter/material.dart';

import '../../../../core/constant/app_images.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      width: 500,
      color: Colors.white.withValues(alpha: 0.2),
      colorBlendMode: BlendMode.lighten,
    );
  }
}