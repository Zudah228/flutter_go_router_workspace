import 'package:flutter/material.dart';

import '../../theme.dart';
import 'pages/home_page.dart';
import 'pages/to_buy/to_buy_page.dart';

class CustomRouterApp extends StatelessWidget {
  const CustomRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: MainTheme.data,
      routerDelegate: CustomRouterDelegate(),
    );
  }
}

class CustomRouterDelegate extends RouterDelegate<Object> {
  CustomRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: const [
        MaterialPage(child: CHomePage()),
        MaterialPage(child: CToBuyPage()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        return true;
      },
    );
  }

  @override
  Future<bool> popRoute() async {
    return true;
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    // TODO: implement setNewRoutePath
  }
}
