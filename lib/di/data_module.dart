import 'package:dio/dio.dart';
import 'package:flutter_base/data/service/weather_service.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base/env_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @lazySingleton
  Dio get dio {
    final Dio dio = Dio();
    dio.interceptors.addAll(getIt<List<Interceptor>>());
    dio.interceptors.add(getIt<ErrorHandlerInterceptor>());
    return dio;
  }

  @injectable
  WeatherService get weatherService {
    return WeatherService(
      getIt<Dio>(),
      baseUrl: getIt<Env>().weatherUrl,
    );
  }

  @Injectable(env: [Environment.dev])
  List<Interceptor> get loggingInterceptorDev {
    List<Interceptor> interceptors = [];
    interceptors.add(LogInterceptor(
      responseBody: true,
      requestHeader: false,
      responseHeader: false,
    ));
    return interceptors;
  }

  @Injectable(env: [Environment.prod])
  List<Interceptor> get loggingInterceptorProd => [];
}

@injectable
class ErrorHandlerInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    getIt.get<ErrorHandler>().dioErrorParser(err);
  }
}
