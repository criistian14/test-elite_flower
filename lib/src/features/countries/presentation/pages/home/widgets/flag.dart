import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/widgets/container_loading.dart';

import '../home_controller.dart';

class Flag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        if (homeCtrl.loading) {
          return ContainerLoading(
            width: double.infinity,
            height: 220.h,
          );
        }

        if (homeCtrl.country == null) {
          return Container(
            width: double.infinity,
            height: 220.h,
            child: Center(
              child: Text(
                "no_image".tr,
              ),
            ),
          );
        }

        return Container(
          width: double.infinity,
          height: 220.h,
          child: SvgPicture.network(
            homeCtrl.country!.flag,
            fit: BoxFit.fitWidth,
          ),
        );
      },
    );
  }
}
