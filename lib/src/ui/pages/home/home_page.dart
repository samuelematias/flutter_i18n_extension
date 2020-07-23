import 'package:flutter/material.dart';
import 'package:flutter_i18n_extension/src/core/i18n/i18n.dart';
import 'package:flutter_i18n_extension/src/core/storage/storage.dart';
import 'package:flutter_i18n_extension/src/ui/pages/detail/detail_page.dart';
import 'package:flutter_i18n_extension/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: Text('i18n extension - Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('WELLCOME'.i18n()),
          ),
          SizedBox(height: 50),
          RaisedButton(
            child: Text('Detail page'),
            onPressed: () {
              Navigator.pushNamed(context, DetailPage.route);
            },
          ),
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
    );
  }
}
