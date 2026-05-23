import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts/features/auth/presentation/screens/login_screen.dart';
import 'package:posts/features/auth/presentation/screens/register_screen.dart';
import 'package:posts/features/posts/presentation/screens/post_detail_screen.dart';
import 'package:posts/features/posts/presentation/screens/post_form_sceen.dart';
import 'package:posts/features/posts/presentation/screens/posts_list_screen.dart';

import '../../features/posts/domain/entities/post_entity.dart';

import '../storage/secure_storage_service.dart';
import '../di/injection.dart';

late GoRouter _appRouter;

class AppRouter {
  static GoRouter router(GlobalKey<NavigatorState> navKey) {
    _appRouter = GoRouter(
      navigatorKey: navKey,
      initialLocation: '/login',
      redirect: (context, state) async {
        final storage = getIt<SecureStorageService>();
        final loggedIn = await storage.hasToken();
        final loc = state.matchedLocation;
        final isAuthScreen = loc == '/login' || loc == '/register';

        // If logged out and not on auth screen, go to login
        if (!loggedIn && !isAuthScreen) return '/login';
        // If logged in and on auth screen, go to posts
        if (loggedIn && isAuthScreen) return '/posts';
        // No redirect needed
        return null;
      },
      routes: [
        GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
        GoRoute(path: '/register', builder: (_, _) => const RegisterScreen()),
        GoRoute(path: '/posts', builder: (_, _) => const PostsListScreen()),
        GoRoute(
          path: '/posts/new',
          builder: (_, _) => const PostFormScreen(),
        ),
        GoRoute(
          path: '/posts/:id',
          builder: (_, s) => PostDetailScreen(id: s.pathParameters['id']!),
        ),
        GoRoute(
          path: '/posts/:id/edit',
          builder: (_, s) => PostFormScreen(post: s.extra as PostEntity?),
        ),
      ],
    );
    return _appRouter;
  }

  /// Trigger router redirect evaluation (used when auth state changes outside of navigation)
  static void refresh() {
    _appRouter.refresh();
  }
}

