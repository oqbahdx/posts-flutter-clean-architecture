import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../network/api_client.dart';
import '../storage/secure_storage_service.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies({required void Function() onUnauthorized}) async {
  // ApiClient is registered manually because it requires a runtime callback.
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient(storage: getIt(), onUnauthorized: onUnauthorized),
  );

  // Generated registrations for injectable classes and external modules.
  await getIt.init();
}
