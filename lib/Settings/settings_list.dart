
import 'package:flutter/material.dart';
import 'colors.dart';
import 'settings_section.dart';

class SettingsList extends StatelessWidget {
  final List<SettingsSection> sections;
  final Color backgroundColor;

  const SettingsList({
    Key key,
    this.sections,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? backgroundGray
          : backgroundColor ?? Colors.black,
      child: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          SettingsSection current = sections[index];
          SettingsSection futureOne;
          try {
            futureOne = sections[index + 1];
          } catch (e) {}

          // Add divider if title is null
          if (futureOne != null && futureOne.title != null) {
            current.showBottomDivider = false;
            return current;
          } else {
            current.showBottomDivider = true;
            return current;
          }
        },
      ),
    );
  }
}
