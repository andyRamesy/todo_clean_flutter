import 'package:flutter/material.dart';
import 'package:todo_clean/application/core/page_config.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.settings,
    name: 'settings',
    child: SettingsPage(),
  );


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
