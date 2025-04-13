import 'package:domain/domain.dart';

abstract class MapRepository {
  /// Returns address by location
  Future<RepositoryResult<AddressModel?>> getAddress({
    required AddressConfig config,
  });

  /// Returns address by location
  Future<RepositoryResult<List<TransportModel>>> findTransport({
    required FindTransportConfig config,
  });
}
