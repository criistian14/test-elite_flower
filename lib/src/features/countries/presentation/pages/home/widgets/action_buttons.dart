import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return Container(
          margin: EdgeInsets.only(
            top: 40.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: homeCtrl.changeTheme,
                child: Text("change_theme".tr),
              ),
              ElevatedButton(
                onPressed: homeCtrl.changeLanguage,
                child: Text("change_language".tr),
              ),
            ],
          ),
        );
      },
    );
  }
}
