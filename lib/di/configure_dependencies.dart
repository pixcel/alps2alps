import 'package:domain/domain.dart' as domain;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:alps2alps/di/configure_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureDependencies(String env) async {
  await domain.configureDomainDependencies(env);
  getIt.$initGetIt(environment: env);
}
