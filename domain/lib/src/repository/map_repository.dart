import 'package:domain/domain.dart';

abstract class MapRepository {
  /// Returns address by location
  Future<RepositoryResult<AddressModel>> getAddress({
    required AddressConfig config,
  });
}
