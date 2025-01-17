import 'package:flutter/material.dart';
import 'package:flutter_i18n_extension/src/ui/widgets/radio/custom_radio.dart';

class RadioTile<T> extends StatelessWidget {
  RadioTile(
      {@required this.value,
      @required this.onChanged,
      @required this.groupValue,
      @required this.title,
      this.subtitle});

  final T value;
  final ValueChanged<T> onChanged;
  final T groupValue;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () => onChanged(value),
      contentPadding: EdgeInsets.all(4.0),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(color: Colors.grey.shade400),
            )
          : null,
      trailing: CustomRadio(
        height: 24,
        width: 24,
        widthBorder: 6,
        value: value,
        onChanged: onChanged,
        groupValue: groupValue,
      ),
    );
  }
}
