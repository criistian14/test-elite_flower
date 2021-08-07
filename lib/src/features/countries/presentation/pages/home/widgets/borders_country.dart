import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/widgets/container_loading.dart';

import '../home_controller.dart';

class BordersCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        if (homeCtrl.loading) {
          return ContainerLoading(
            width: double.infinity,
            height: 63.h,
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
            top: 9.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 17.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "borders".tr,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 18.sp,
                    ),
              ),
              SizedBox(
                height: 10.h,
              ),
              if (homeCtrl.country!.borders != null)
                Tags(
                  itemCount: homeCtrl.country!.borders!.length,
                  itemBuilder: (int index) {
                    final item = homeCtrl.country!.borders![index];

                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
