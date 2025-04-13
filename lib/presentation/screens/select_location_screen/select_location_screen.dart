import 'package:alps2alps/di/configure_dependencies.dart';
import 'package:alps2alps/general/constants.dart';
import 'package:alps2alps/presentation/screens/select_location_screen/bloc/select_location_screen_bloc.dart';
import 'package:alps2alps/presentation/widgets/app_progress_widget.dart';
import 'package:design/design.dart' as design;
import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({required this.title, super.key});

  final String title;

  static Route route({required String title}) {
    return MaterialPageRoute(
      builder: (_) => SelectLocationScreen(title: title),
      settings: const RouteSettings(),
    );
  }

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen>
    with SingleTickerProviderStateMixin {
  static const minSizeAddressSheet = 0.1;
  static const maxSizeAddressSheet = 0.2;

  late final SelectLocationScreenBloc _bloc;
  late final DraggableScrollableController _addressSheetController;

  GoogleMapController? _mapController;

  @override
  void initState() {
    _bloc = SelectLocationScreenBloc(
      mapRepository: getIt<domain.MapRepository>(),
    )..add(const Initialize());
    _addressSheetController = DraggableScrollableController();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _addressSheetController.dispose();
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
          // when detected address
          BlocListener<SelectLocationScreenBloc, SelectLocationScreenState>(
            listenWhen: (previous, current) {
              return previous.address == null && current.address != null;
            },
            listener: (context, state) {
              _expandAddressSheet();
            },
          ),
          BlocListener<SelectLocationScreenBloc, SelectLocationScreenState>(
            listenWhen: (previous, current) {
              return previous.address != null && current.address == null;
            },
            listener: (context, state) {
              _collapseAddressSheet();
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
                        _bloc.add(SetLocation(location: value));
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
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            Text(
                              widget.title,
                              style: design.AppTextStylesTokens.heading04(
                                color: design.AppColorsTokens.text03,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Sheet UI (non-modal)
                    DraggableScrollableSheet(
                      controller: _addressSheetController,
                      initialChildSize: minSizeAddressSheet,
                      minChildSize: minSizeAddressSheet,
                      maxChildSize: maxSizeAddressSheet,
                      builder: (context, scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                design.AppSpacingTokens.five,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: design.AppSpacingTokens.twoAndHalf,
                                offset: Offset(0, -design.AppSpacingTokens.one),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              ListView(
                                controller: scrollController,
                                padding: EdgeInsets.all(
                                  design.AppSpacingTokens.four,
                                ),
                                children: [
                                  Center(
                                    child: Container(
                                      width: design.AppSpacingTokens.ten,
                                      height: design.AppSpacingTokens.one,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(
                                    height: design.AppSpacingTokens.four,
                                  ),
                                  if (state.address == null &&
                                      !state.searching) ...[
                                    Text(
                                      'Please select point on the map by long press',
                                      style: design.AppTextStylesTokens.body02(
                                        color: design.AppColorsTokens.text04,
                                      ),
                                    ),
                                  ] else if (state.searching) ...[
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              right:
                                                  design.AppSpacingTokens.two,
                                            ),
                                            child: Text(
                                              'Loadin address, please wait ...',
                                              style: design
                                                  .AppTextStylesTokens.body02(
                                                color:
                                                    design
                                                        .AppColorsTokens
                                                        .text04,
                                              ),
                                            ),
                                          ),
                                        ),
                                        AppProgressWidget(
                                          size: design.AppSpacingTokens.four,
                                        ),
                                      ],
                                    ),
                                  ] else if (state.address != null) ...[
                                    Text(
                                      'Address: ${state.address!.address}',
                                      style: design.AppTextStylesTokens.body02(
                                        color: design.AppColorsTokens.text04,
                                      ),
                                    ),
                                  ],
                                  if (state.address != null) ...[
                                    SizedBox(
                                      height: design.AppSpacingTokens.eight,
                                    ),
                                    ElevatedButton(
                                      onPressed:
                                          state.address == null
                                              ? null
                                              : () {
                                                Navigator.pop(
                                                  context,
                                                  state.address,
                                                );
                                              },
                                      child: Text('Select'),
                                    ),
                                  ],
                                ],
                              ),
                              Positioned(
                                right: design.AppSpacingTokens.four,
                                top: design.AppSpacingTokens.four,
                                child: Visibility(
                                  visible: state.address != null,
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  child: Container(
                                    width: design.AppSpacingTokens.eight,
                                    height: design.AppSpacingTokens.eight,
                                    decoration: BoxDecoration(
                                      color:
                                          Colors.grey[300], // gray background
                                      shape:
                                          BoxShape
                                              .circle, // or BoxShape.rectangle if you want square
                                    ),
                                    child: IconButton(
                                      iconSize: design.AppSpacingTokens.four,
                                      onPressed: () {
                                        _bloc.add(ResetLocation());
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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

  void _expandAddressSheet() {
    _addressSheetController.animateTo(
      maxSizeAddressSheet,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _collapseAddressSheet() {
    _addressSheetController.animateTo(
      minSizeAddressSheet,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
