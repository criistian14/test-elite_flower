import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'widgets/action_buttons.dart';
import 'widgets/borders_country.dart';
import 'widgets/coordenates_country.dart';
import 'widgets/currency_country.dart';
import 'widgets/flag.dart';
import 'widgets/name_country.dart';
import 'widgets/population_country.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return Scaffold(
          body: SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Flag(),
                  NameCountry(),
                  PopulationCountry(),
                  BordersCountry(),
                  CoordenatesCountry(),
                  CurrencyCountry(),
                  ActionButtons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
