import 'package:flutter/material.dart';
import 'package:todo_clean/application/pages/dashboard/dashboard_page.dart';
import 'package:todo_clean/application/pages/overview/overview_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static var tabs = [
    DashboardPage.pageConfig,
    OverviewPage.pageConfig,
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
