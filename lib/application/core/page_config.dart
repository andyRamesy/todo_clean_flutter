import 'package:flutter/widgets.dart';

class PageConfig {
  final IconData icon;
  final String name;
  final Widget child;

   const PageConfig({
    required this.name,
    required this.icon,
    required Widget? child,
  }) : child = child ?? const Placeholder();
}
