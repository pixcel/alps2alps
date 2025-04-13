import 'package:data/src/di/global_aliases.dart';
import 'package:data/src/repository/base/base_repository_helper.dart';
import 'package:domain/domain.dart' as domain;
import 'package:injectable/injectable.dart';

@LazySingleton(as: domain.MapRepository)
class ConfigRepository
    with BaseRepositoryHelper
    implements domain.MapRepository {
  @override
  Future<domain.RepositoryResult<domain.AddressModel?>> getAddress({
    required domain.AddressConfig config,
  }) async {
    final response = await execute<domain.AddressModel>(() async {
      final responseData = await geocodingApi.execute(config: config);

      final result = await _processGeocodingResponse(
        config: config,
        responseData: responseData,
      );
      return domain.RepositoryResult.completed(data: result);
    });
    return response;
  }

  @override
  Future<domain.RepositoryResult<List<domain.TransportModel>>> findTransport(
      {required domain.FindTransportConfig config}) async {
    final response = await execute<List<domain.TransportModel>>(() async {
      // TODO: it's just mock for demonstrate logic
      await Future.delayed(Duration(seconds: 2));
      final List<domain.TransportModel> fakeList = [];
      fakeList.add(domain.TransportModel(name: 'Car 1'));
      fakeList.add(domain.TransportModel(name: 'Car 2'));

      return domain.RepositoryResult.completed(data: fakeList);
    });
    return response;
  }

  Future<domain.AddressModel?> _processGeocodingResponse({
    required domain.AddressConfig config,
    required dynamic responseData,
  }) async {
    if (responseData == null) {
      return null;
    }

    final status = responseData['status'];
    if (status != 'OK') {
      return null;
    }

    final results = responseData['results'];
    if (results == null || results.isEmpty) {
      return null;
    }

    //Using the first result which is typically the most accurate
    final addressData = results[0];
    final geocodingMapAddressModel = _convertGoogleAddressDataToModel(
      config: config,
      addressData: addressData,
    );

    return geocodingMapAddressModel;
  }

  domain.AddressModel _convertGoogleAddressDataToModel({
    required domain.AddressConfig config,
    Map<String, dynamic>? addressData,
  }) {
    String countryCode = '';
    String countryName = '';
    String city = '';
    String postalCode = '';
    String streetNumber = '';
    String route = '';
    String houseName = '';

    //Extract address components first
    for (final component in addressData?['address_components']) {
      final types = component['types'];

      if (types.contains('country')) {
        countryCode = component['short_name'] ??
            ''; // This gets the 2-letter country code
        countryName = component['long_name'] ?? '';
      } else if (types.contains('locality') || types.contains('postal_town')) {
        city = component['long_name'] ?? '';
      } else if (types.contains('administrative_area_level_2') &&
          city.isEmpty) {
        //Fallback (for city if locality is not available)
        city = component['long_name'] ?? '';
      } else if (types.contains('postal_code')) {
        postalCode = component['long_name'] ?? '';
      } else if (types.contains('street_number')) {
        streetNumber = component['long_name'] ?? '';
      } else if (types.contains('route')) {
        route = component['long_name'] ?? '';
      } else if (types.contains('premise') || types.contains('subpremise')) {
        houseName = component['long_name'] ?? '';
      }
    }

    return domain.AddressModel(
      countryCode: countryCode,
      countryName: countryName,
      city: city,
      street: route,
      houseNumber: streetNumber,
      zipCode: postalCode,
      houseName: houseName,
      location: config.location,
    );
  }
}
