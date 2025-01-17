import 'package:booklyapp/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:booklyapp/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:booklyapp/Features/home/data/repo/home_repo_impl.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupApiServer() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource:
          HomeRemoteDataSourceImp(apiService: getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImp(),
    ),
  );
}
