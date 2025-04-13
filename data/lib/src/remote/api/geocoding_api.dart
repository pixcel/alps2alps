import 'dart:async';

import 'package:data/src/di/global_aliases.dart';
import 'package:data/src/remote/api/base/base_api_repository.dart';
import 'package:data/src/remote/api/base/request_type.dart';
import 'package:domain/domain.dart' as domain;
import 'package:injectable/injectable.dart';

@lazySingleton
class GeocodingApi extends BaseApiRepository {
  static const _baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json?';

  Future<dynamic> execute({
    required domain.AddressConfig config,
  }) async {
    final url =
        '${_baseUrl}latlng=${config.location.latitude},${config.location.longitude}&key=${configRepository.geocodingApiKey}&result_type=street_address|premise|subpremise';

    final response = await executeRequest(
      requestType: RequestType.get,
      path: url,
      overrideBaseUrl: true,
    );

    if (!response.hasException && response.hasData) {
      return response.data;
    } else {
      return null;
    }
  }
}
