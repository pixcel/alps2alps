import 'dart:async';

import 'package:alps2alps/di/configure_dependencies.dart' as di;
import 'package:alps2alps/general/constants.dart';
import 'package:alps2alps/presentation/screens/splash_screen/splash_screen.dart';
import 'package:design/design.dart' as design;
import 'package:domain/domain.dart' as domain;
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      Future<void> configure;
      configure =
          kReleaseMode
              ? di.configureDependencies(Environment.prod)
              : di.configureDependencies(Environment.dev);
      configure.whenComplete(() {
        GetIt.instance.allReady().whenComplete(() async {
          await SystemChrome.setPreferredOrientations(Constants.orientations);
          final configRepository = getIt<domain.ConfigRepository>();
          // TODO: should be refactored
          await configRepository.initialize(config: domain.ConfigModel());

          runApp(
            MaterialApp(
              title: 'Alps2Alps Test',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: design.AppColorsTokens.background01,
                  brightness: Brightness.light,
                ),
                useMaterial3: true,
              ),
              home: const SplashScreen(),
            ),
          );
        });
      });
    },
    (Object error, StackTrace stackTrace) async {
      try {
        final logRepository = getIt<domain.LogRepository>();
        logRepository.error(
          target: 'runZonedGuarded',
          error: error,
          stackTrace: stackTrace,
        );
      } catch (_) {
        final logRepository = await domain.LogRepository.createInstance();
        logRepository.error(
          target: 'runZonedGuarded',
          error: error,
          stackTrace: stackTrace,
        );
      }
    },
  );
}
