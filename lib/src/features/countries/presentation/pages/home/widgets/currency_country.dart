import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/widgets/container_loading.dart';

import '../home_controller.dart';

class CurrencyCountry extends StatelessWidget {
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
          child: Text(
            " ${"currencie".tr} ${homeCtrl.country!.currencies!.first.name}",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 18.sp,
                ),
          ),
        );
      },
    );
  }
}
