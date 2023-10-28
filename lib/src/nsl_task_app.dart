// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nsl_task/src/provider_registration.dart';
import 'package:nsl_task/src/ui_layer/screens/students_list_screen.dart';
import 'package:provider/provider.dart';

/// Navigator key is to get the current context, state and widget of the
/// Material App
final navigatorKey = GlobalKey<NavigatorState>();

class NslTakApp extends StatefulWidget {
  const NslTakApp({super.key});

  @override
  State<NslTakApp> createState() => _NslTakAppState();
}

class _NslTakAppState extends State<NslTakApp> {
  @override
  Widget build(BuildContext context) {
    return _materialApp(context);
  }

  /// Method used to return material app widget
  Widget _materialApp(BuildContext context) {
    return MultiProvider(
      providers: RegisterProviders.providers(context),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const StudentsListScreen(),
        navigatorObservers: const <NavigatorObserver>[],
      ),
    );
  }
}
