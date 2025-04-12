import 'package:data/data.dart';
import 'package:domain/domain.dart' as domain;

/// repositories
final logRepository = getIt<domain.LogRepository>();
final codewarsRepository = getIt<domain.CodewarsRepository>();
final configRepository = getIt<domain.ConfigRepository>();
