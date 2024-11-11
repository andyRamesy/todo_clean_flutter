import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_clean/application/core/go_router_observer.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final routes = GoRouter(
  initialLocation: '/home/start',
  observers: <NavigatorObserver>[GoRouterObserver()],
  routes: [
    GoRoute(
      path: '/home/settings',
      builder: (context, state) {
        return Container(
          color: Colors.amber,
          child: Column(
            key: _rootNavigatorKey,
            children: [
              ElevatedButton(
                  onPressed: () => context.go('/home/start'),
                  child: const Text('Go to start')),
              TextButton(
                  onPressed: () => context.pop(), child: const Text('Go back'))
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
            key: _rootNavigatorKey,
            children: [
              ElevatedButton(
                  onPressed: () => context.go('/home/settings'),
                  child: const Text('Go to settings')),
              TextButton(
                  onPressed: () => context.pop(), child: const Text('Go back'))
            ],
          ),
        );
      },
    )
  ],
);
