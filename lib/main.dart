import 'package:flutter/material.dart';
import 'package:flutter_go_router_workspace/apps/custom_router_app/custom_router_app.dart';
import 'package:flutter_go_router_workspace/apps/go_router_app/go_router_app.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouterType? _appRouterType;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MainTheme.data,
      home: Stack(
        children: [
          Offstage(
            offstage: _appRouterType != null,
            child: _AppSelectPage(
              onChanged: (value) {
                setState(() {
                  _appRouterType = value;
                });
              },
            ),
          ),
          Offstage(
            offstage: _appRouterType != AppRouterType.goRouter,
            child: const GoRouterApp(),
          ),
          Offstage(
            offstage: _appRouterType != AppRouterType.custom,
            child: const CustomRouterApp(),
          ),
        ],
      ),
    );
  }
}

enum AppRouterType {
  custom,
  goRouter,
  ;
}

class _AppSelectPage extends StatelessWidget {
  const _AppSelectPage({required this.onChanged});

  final ValueChanged<AppRouterType> onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アプリを選択'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
              onPressed: () {
                onChanged(AppRouterType.custom);
              },
              child: const Text('Custom Router'),
            ),
            FilledButton(
              onPressed: () {
                onChanged(AppRouterType.goRouter);
              },
              child: const Text('Go Router'),
            ),
          ],
        ),
      ),
    );
  }
}
