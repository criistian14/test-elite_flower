import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/theme/constants_theme.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: ConstantsTheme.iconColor,
        body: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 130.h,
          ),
        ),
      ),
    );
  }
}
