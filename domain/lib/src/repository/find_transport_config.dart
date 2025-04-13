import 'package:domain/domain.dart';

class FindTransportConfig extends RepositoryConfig {
  FindTransportConfig({
    required this.pickupAddress,
    required this.destinationAddress,
    required this.time,
    required this.passengersCount,
  });

  final AddressModel pickupAddress;
  final AddressModel destinationAddress;
  final DateTime time;
  final int passengersCount;
}
