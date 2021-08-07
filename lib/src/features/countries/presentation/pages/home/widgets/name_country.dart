import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/widgets/container_loading.dart';

import '../home_controller.dart';

class NameCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        if (homeCtrl.loading) {
          return ContainerLoading(
            width: double.infinity,
            height: 39.h,
            margin: EdgeInsets.only(
              top: 20.h,
              left: 15.w,
              right: 15.w,
            ),
          );
        }

        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 20.h,
            left: 15.w,
            right: 15.w,
          ),
          child: Text(
            homeCtrl.country!.name,
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontSize: 38.sp,
                ),
          ),
        );
      },
    );
  }
}
