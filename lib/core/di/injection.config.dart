// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/posts/data/datasources/posts_remote_datasource.dart'
    as _i501;
import '../../features/posts/data/repositories/posts_repository_impl.dart'
    as _i675;
import '../../features/posts/domain/repositories/posts_repository.dart'
    as _i245;
import '../../features/posts/domain/usecases/create_post_usecase.dart' as _i70;
import '../../features/posts/domain/usecases/delete_post_usecase.dart' as _i223;
import '../../features/posts/domain/usecases/get_post_by_id_usecase.dart'
    as _i402;
import '../../features/posts/domain/usecases/get_posts_usecase.dart' as _i158;
import '../../features/posts/domain/usecases/update_post_usecase.dart' as _i321;
import '../../features/posts/presentation/bloc/post_detail/post_detail_bloc.dart'
    as _i372;
import '../../features/posts/presentation/bloc/post_form/post_form_bloc.dart'
    as _i359;
import '../../features/posts/presentation/bloc/posts_list/posts_list_bloc.dart'
    as _i66;
import '../network/network_info.dart' as _i932;
import '../storage/secure_storage_service.dart' as _i666;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i161.InternetConnection>(
      () => registerModule.internetConnection,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i501.PostsRemoteDataSource>(
      () => _i501.PostsRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => _i161.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i666.SecureStorageService>(
      () => _i666.SecureStorageServiceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i161.InternetConnection>()),
    );
    gh.lazySingleton<_i245.PostsRepository>(
      () => _i675.PostsRepositoryImpl(
        gh<_i501.PostsRemoteDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i161.AuthRemoteDataSource>(),
        gh<_i666.SecureStorageService>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i941.RegisterUseCase>(),
        gh<_i48.LogoutUseCase>(),
        gh<_i787.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i70.CreatePostUseCase>(
      () => _i70.CreatePostUseCase(gh<_i245.PostsRepository>()),
    );
    gh.lazySingleton<_i223.DeletePostUseCase>(
      () => _i223.DeletePostUseCase(gh<_i245.PostsRepository>()),
    );
    gh.lazySingleton<_i402.GetPostByIdUseCase>(
      () => _i402.GetPostByIdUseCase(gh<_i245.PostsRepository>()),
    );
    gh.lazySingleton<_i158.GetPostsUseCase>(
      () => _i158.GetPostsUseCase(gh<_i245.PostsRepository>()),
    );
    gh.lazySingleton<_i321.UpdatePostUseCase>(
      () => _i321.UpdatePostUseCase(gh<_i245.PostsRepository>()),
    );
    gh.factory<_i372.PostDetailBloc>(
      () => _i372.PostDetailBloc(gh<_i402.GetPostByIdUseCase>()),
    );
    gh.factory<_i66.PostsListBloc>(
      () => _i66.PostsListBloc(
        gh<_i158.GetPostsUseCase>(),
        gh<_i223.DeletePostUseCase>(),
      ),
    );
    gh.factory<_i359.PostFormBloc>(
      () => _i359.PostFormBloc(
        gh<_i70.CreatePostUseCase>(),
        gh<_i321.UpdatePostUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i212.RegisterModule {}
