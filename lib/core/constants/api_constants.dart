import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class ApiConstants {
  ApiConstants._();

  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:5248';
    if (Platform.isAndroid) return 'http://10.0.2.2:5248';
    return 'http://localhost:5248';
  }

  // Auth
  static const String register = '/api/auth/register';
  static const String login = '/api/auth/login';

  // Posts
  static const String posts = '/api/posts';
  static String postById(String id) => '/api/posts/$id';

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String emailKey = 'user_email';
  static const String expiresAtKey = 'expires_at';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
