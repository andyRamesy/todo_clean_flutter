import 'package:flutter/material.dart';
import 'package:todo_clean/application/core/page_config.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.voice_over_off,
    name: 'overvierw',
    child: OverviewPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
