import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressModel extends Equatable {
  final String address;
  final LatLng location;

  const AddressModel({
    required this.address,
    required this.location,
  });

  @override
  List<Object> get props => [
        address,
        location,
      ];
}
