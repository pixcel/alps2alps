import 'package:domain/domain.dart';
import 'package:domain/src/repository/find_transport_config.dart';

abstract class MapRepository {
  /// Returns address by location
  Future<RepositoryResult<AddressModel>> getAddress({
    required AddressConfig config,
  });

  /// Returns address by location
  Future<RepositoryResult<List<TransportModel>>> findTransport({
    required FindTransportConfig config,
  });
}
