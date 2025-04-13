import 'package:data/data.dart';
import 'package:domain/domain.dart' as domain;

/// repositories
final logRepository = getIt<domain.LogRepository>();
final codewarsRepository = getIt<domain.MapRepository>();
final configRepository = getIt<domain.ConfigRepository>();
