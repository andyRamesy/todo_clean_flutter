import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_clean/application/core/go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final routes = GoRouter(
  initialLocation: '/home/start',
  navigatorKey: _rootNavigatorKey,
  observers: <NavigatorObserver>[GoRouterObserver()],
  routes: [
    GoRoute(
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
