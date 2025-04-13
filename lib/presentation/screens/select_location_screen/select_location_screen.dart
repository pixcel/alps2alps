import 'package:alps2alps/di/configure_dependencies.dart';
import 'package:alps2alps/general/constants.dart';
import 'package:alps2alps/presentation/screens/select_location_screen/bloc/select_location_screen_bloc.dart';
import 'package:design/design.dart' as design;
import 'package:domain/domain.dart' as domain;
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
  late final SelectLocationScreenBloc _bloc;

  GoogleMapController? _mapController;

  @override
  void initState() {
    _bloc = SelectLocationScreenBloc(
      mapRepository: getIt<domain.MapRepository>(),
    )..add(const Initialize());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => _bloc)],
      child: MultiBlocListener(
        listeners: [
          // when detected current location
          BlocListener<SelectLocationScreenBloc, SelectLocationScreenState>(
            listenWhen: (previous, current) {
              return previous.currentLocation == null &&
                  current.currentLocation != null;
            },
            listener: (context, state) {
              _mapController?.animateCamera(
                CameraUpdate.newLatLngZoom(state.currentLocation!, 12),
              );
            },
          ),
          // when selected location
          BlocListener<SelectLocationScreenBloc, SelectLocationScreenState>(
            listenWhen: (previous, current) {
              return previous.location == null && current.location != null;
            },
            listener: (context, state) {
              // TODO: need show modal UI with address search
            },
          ),
        ],
        child: BlocBuilder<SelectLocationScreenBloc, SelectLocationScreenState>(
          builder: (context, state) {
            final markers = <Marker>{};
            if (state.location != null) {
              markers.add(
                Marker(
                  markerId: MarkerId("custom_marker"),
                  position: state.location!,
                ),
              );
            }
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: design.AppOverlayStyleTokens.systemUiOverlayStyle,
              child: Scaffold(
                backgroundColor: design.AppColorsTokens.background02,
                body: Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: Constants.defaultMapPosition,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: false,
                      zoomControlsEnabled: false,
                      mapToolbarEnabled: false,
                      compassEnabled: false,
                      padding: EdgeInsets.only(
                        bottom: design.AppSpacingTokens.four,
                      ),
                      style: Constants.defaultMapStyle,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      onLongPress: (LatLng value) {
                        if (!state.searching) {
                          _bloc.add(SetLocation(location: value));
                        }
                      },
                      markers: markers,
                    ),
                    Positioned(
                      top: design.AppSpacingTokens.eighteen,
                      left: design.AppSpacingTokens.four,
                      right: design.AppSpacingTokens.four,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: design.AppSpacingTokens.two,
                          vertical: design.AppSpacingTokens.one,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            design.AppSpacingTokens.nine,
                          ),
                          boxShadow: [design.AppDecorationTokens.boxShadow1],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            Text(
                              'Please select point',
                              style: design.AppTextStylesTokens.heading04(
                                color: design.AppColorsTokens.text03,
                              ),
                            ),
                            Visibility(
                              visible: state.location != null,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: IconButton(
                                onPressed: () {
                                  _bloc.add(ResetLocation());
                                },
                                icon: Icon(Icons.close),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
