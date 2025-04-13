import 'package:data/src/di/configure_dependencies.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initDataGetIt')
Future<void> configureDataDependencies(String env) async {
  getIt.$initDataGetIt(environment: env);
}
