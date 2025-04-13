import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressModel extends Equatable {
  final LatLng location;
  final String countryName;
  final String countryCode;
  final String city;
  final String street;
  final String houseNumber;
  final String zipCode;
  final String houseName;

  String get address {
    final result = StringBuffer();

    if (street.isNotEmpty && houseNumber.isNotEmpty) {
      result.write('$street $houseNumber, ');
    }

    if (city.isNotEmpty) {
      result.write('$city, ');
    }

    if (countryName.isNotEmpty) {
      result.write('$countryName, ');
    }

    if (zipCode.isNotEmpty) {
      result.write(zipCode);
    }

    return result.toString();
  }

  const AddressModel({
    required this.location,
    required this.countryName,
    required this.countryCode,
    required this.city,
    required this.street,
    required this.houseNumber,
    required this.zipCode,
    required this.houseName,
  });

  @override
  List<Object> get props => [
        location,
        countryName,
        countryCode,
        city,
        street,
        houseNumber,
        zipCode,
        houseName,
      ];
}
