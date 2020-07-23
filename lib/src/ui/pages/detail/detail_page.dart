import 'package:flutter/material.dart';

import 'package:flutter_i18n_extension/src/core/storage/storage.dart';
import 'package:flutter_i18n_extension/src/ui/widgets/widgets.dart';
import 'package:flutter_i18n_extension/src/core/i18n/i18n.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  static final String route = '/detail';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  StoredSettings _settings;

  @override
  void initState() {
    super.initState();
    _settings = context.read<StoredSettings>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('i18n extension - Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('NOW'.i18n()),
                SizedBox(height: 50),
                RadioTile<String>(
                  groupValue: _settings.localeKey,
                  onChanged: (String value) {
                    _settings.updateLocaleKey(value);
                  },
                  title: 'English',
                  value: 'en_us',
                ),
                RadioTile<String>(
                  groupValue: _settings.localeKey,
                  onChanged: (String value) {
                    _settings.updateLocaleKey(value);
                  },
                  title: 'Spanish',
                  value: 'es_mx',
                ),
                RadioTile<String>(
                  groupValue: _settings.localeKey,
                  onChanged: (String value) {
                    _settings.updateLocaleKey(value);
                  },
                  title: 'Portuguese',
                  value: 'pt_br',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
