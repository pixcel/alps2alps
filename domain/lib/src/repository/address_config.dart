import 'package:domain/src/repository/base/repository_config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressConfig extends RepositoryConfig {
  AddressConfig({
    required this.location,
  });

  final LatLng location;
}
