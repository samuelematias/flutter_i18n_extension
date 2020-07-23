import 'package:flutter_i18n_extension/src/core/storage/storage.dart';

extension InternationalizationExtesntion on String {
  String i18n({String lang = ""}) {
    // If want use by device locale
    // final String _languageCode =
    //     (lang == null || lang.isEmpty) ? getLocaleStr(getDeviceLocale.languageCode) : lang;

    final String _languageCode =
        (lang == null || lang.isEmpty) ? StoredSettings.getLocaleKey() : lang;

    final Map<String, Map<String, String>> dic = {
      "WELLCOME": {
        "en_us": "Welcome",
        "es_mx": "Bien Venido",
        "pt_br": "Bem Vindo",
      },
      "NOW": {"pt_br": "Agora", "en_us": "Now", "es_mx": "Ahora"}
    };

    return dic[this][_languageCode];
  }
}
