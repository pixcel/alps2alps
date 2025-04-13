import 'package:data/data.dart' as data;
import 'package:domain/src/di/configure_dependencies.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initDomainGetIt')
Future<void> configureDomainDependencies(String env) async {
  await data.configureDataDependencies(env);
  getIt.$initDomainGetIt(environment: env);
}
