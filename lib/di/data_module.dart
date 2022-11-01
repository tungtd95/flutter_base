import 'package:dio/dio.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_base/data/service/weather_service.dart';
import 'package:flutter_base/data/utils/exception_handler.dart';
import 'package:flutter_base/di/di.dart';
import 'package:flutter_base_config/env_config.dart';
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
    final aliceInterceptor = getIt<AliceWrapper>().alice?.getDioInterceptor();
    if (aliceInterceptor != null) {
      interceptors.add(aliceInterceptor);
    }
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

abstract class AliceWrapper {
  Alice? get alice;
}

@Singleton(as: AliceWrapper, env: [Environment.prod])
class AliceProd extends AliceWrapper {
  @override
  Alice? get alice => null;
}

@Singleton(as: AliceWrapper, env: [Environment.dev])
class AliceDev extends AliceWrapper {
  Alice? _alice;

  @override
  Alice? get alice {
    if (this._alice == null) {
      _alice = Alice();
    }
    return _alice;
  }
}
