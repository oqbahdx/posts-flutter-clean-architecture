import 'package:flutter/material.dart';
import 'package:posts/core/app.dart';
import 'package:posts/core/router/app_router.dart';
import 'core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(onUnauthorized: () {
    // Trigger GoRouter redirect evaluation when token is cleared by interceptor
    AppRouter.refresh();
  });
  runApp(const App());
}
