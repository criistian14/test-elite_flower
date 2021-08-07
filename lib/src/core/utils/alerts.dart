import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';

class Alerts {
  static errorAlertUseCase(Failure failure) {
    String messageError;

    if (failure is ServerFailure) {
      messageError = failure.error;
    } else if (failure is CacheFailure) {
      messageError = failure.error;
    } else {
      messageError = failure.toString();
    }

    Get.snackbar(
      "Error: ",
      messageError,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
