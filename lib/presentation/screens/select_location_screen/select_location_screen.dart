import 'dart:async';

import 'package:alps2alps/presentation/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:alps2alps/presentation/screens/select_location_screen/map_constants.dart';
import 'package:design/design.dart' as design;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => SelectLocationScreen(),
      settings: const RouteSettings(),
    );
  }

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen>
    with SingleTickerProviderStateMixin {
  late final MainScreenBloc _mainScreenBloc;

  final _controller = Completer<GoogleMapController>();

  static const _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  void initState() {
    _mainScreenBloc = MainScreenBloc();
    super.initState();
  }

  @override
  void dispose() {
    _mainScreenBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => _mainScreenBloc)],
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: design.AppOverlayStyleTokens.systemUiOverlayStyle,
            child: Scaffold(
              backgroundColor: design.AppColorsTokens.background02,
              body: GoogleMap(
                initialCameraPosition: MapConstants.defaultMapPosition,
                // onCameraIdle: store.handleCameraIdle,
                // onCameraMoveStarted: store.handleCameraMoveStarted,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                compassEnabled: false,
                padding: EdgeInsets.only(bottom: design.AppSpacingTokens.four),
                style: MapConstants.mapStyle,
                onMapCreated: (GoogleMapController controller) {
                  // TODO: need to omplement
                  //store.setMapController(controller);
                },

                // mapType: MapType.hybrid,
                // initialCameraPosition: _kGooglePlex,
                // onMapCreated: (GoogleMapController controller) {
                //   _controller.complete(controller);
                // },
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: _goToTheLake,
                label: const Text('To the lake!'),
                icon: const Icon(Icons.directions_boat),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
