import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/core/di/injection.dart';
import 'package:posts/core/router/app_router.dart';
import 'package:posts/core/theme/app_theme.dart';
import 'package:posts/features/auth/presentation/bloc/auth_bloc.dart';


final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Posts App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: AppRouter.router(navigatorKey),
      ),
    );
  }
}
