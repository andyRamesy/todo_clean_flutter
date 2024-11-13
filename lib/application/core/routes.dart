import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_clean/application/core/go_router_observer.dart';
import 'package:todo_clean/application/pages/home/home_page.dart';
import 'package:todo_clean/application/pages/settings/settings_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routes = GoRouter(
  initialLocation: '/home/dashboard',
  navigatorKey: _rootNavigatorKey,
  observers: <NavigatorObserver>[GoRouterObserver()],
  routes: [
    GoRoute(
      name: SettingsPage.pageConfig.name,
      path: '/home/settings',
      builder: (context, state) {
        return Container(
          color: Colors.amber,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => context.go('/home/start'),
                  child: const Text('Go to start')),
              TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go("/home/start");
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
          path: '/home/:tab',
          builder: (context, state) =>  HomePage(key: state.pageKey,tab: state.pathParameters['tab']!,),
        ),
      ],
    ),
    GoRoute(
      path: '/home/start',
      builder: (context, state) {
        return Container(
          color: Colors.blueGrey,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => context.go('/home/settings'),
                  child: const Text('Go to settings')),
              TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go("/home/settings");
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
