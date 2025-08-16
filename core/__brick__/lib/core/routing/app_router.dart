import 'package:built_v/core/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: Routes.home,
        path: '/',
        // path: '/home',
        // builder: (BuildContext context, GoRouterState state) =>
        //     const HomePage(),
      ),
    ],
  );
}
