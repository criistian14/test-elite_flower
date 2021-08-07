import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/widgets/container_loading.dart';

import '../home_controller.dart';

class CoordenatesCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        if (homeCtrl.loading) {
          return ContainerLoading(
            width: double.infinity,
            height: 19.h,
            margin: EdgeInsets.only(
              top: 14.h,
              left: 15.w,
              right: 15.w,
            ),
          );
        }

        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 14.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " ${"latitude".tr}: ${homeCtrl.country!.lat}",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
              Text(
                " ${"longitude".tr}: ${homeCtrl.country!.lng}",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
