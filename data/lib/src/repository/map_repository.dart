import 'package:data/src/repository/base/base_repository_helper.dart';
import 'package:domain/domain.dart' as domain;
import 'package:injectable/injectable.dart';

@LazySingleton(as: domain.MapRepository)
class ConfigRepository
    with BaseRepositoryHelper
    implements domain.MapRepository {
  @override
  Future<domain.RepositoryResult<domain.AddressModel>> getAddress({
    required domain.AddressConfig config,
  }) async {
    final response = await execute<domain.AddressModel>(() async {
      // TODO: need to implement
      await Future.delayed(Duration(seconds: 2));
      return domain.RepositoryResult.completed(
        data: domain.AddressModel(
            address: 'Test address', location: config.location),
      );
    });
    return response;
  }
}
