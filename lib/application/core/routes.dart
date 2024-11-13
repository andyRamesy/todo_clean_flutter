import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_clean/application/core/go_router_observer.dart';
import 'package:todo_clean/application/pages/dashboard/dashboard_page.dart';
import 'package:todo_clean/application/pages/home/home_page.dart';
import 'package:todo_clean/application/pages/settings/settings_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const String _basePath = '/home';

final routes = GoRouter(
  initialLocation: '$_basePath/${DashboardPage.pageConfig.name}',
  navigatorKey: _rootNavigatorKey,
  observers: <NavigatorObserver>[GoRouterObserver()],
  routes: [
    GoRoute(
      name: SettingsPage.pageConfig.name,
      path: '$_basePath/${SettingsPage.pageConfig.name}',
      builder: (context, state) {
        return Container(
          color: Colors.amber,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => context.go('$_basePath/start'),
                  child: const Text('Go to start')),
              TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go("$_basePath/start");
                    }
                  },
                  child: const Text('Go back'))
            ],
          ),
        );
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          name: HomePage.pageConfig.name,
          path: '$_basePath/:tab',
          builder: (context, state) => HomePage(
            key: state.pageKey,
            tab: state.pathParameters['tab']!,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '$_basePath/start',
      builder: (context, state) {
        return Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => context.go('$_basePath/settings'),
                  child: const Text('Go to settings')),
              TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go("$_basePath/settings");
                    }
                  },
                  child: const Text('Go back'))
            ],
          ),
        );
      },
    )
  ],
);
