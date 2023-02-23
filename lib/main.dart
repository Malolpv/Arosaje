import 'package:arosaje/navigation/navigation_delegate.dart';
import 'package:arosaje/navigation/navigation_route_parser.dart';
import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final NavigationDelegate _navigationDelegate = NavigationDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Arosaje',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routeInformationParser: NavigationRouteParser(),
      routerDelegate: _navigationDelegate,
    );
  }
}
