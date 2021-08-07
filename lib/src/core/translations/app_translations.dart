import 'package:get/get.dart';

import 'messages.dart';
import 'titles.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          ...TitlesTranslations().en,
          ...MessagesTranslations().en,
        },
        "es": {
          ...TitlesTranslations().es,
          ...MessagesTranslations().es,
        }
      };
}
