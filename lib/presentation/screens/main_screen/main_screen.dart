import 'package:alps2alps/presentation/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:alps2alps/presentation/screens/select_location_screen/select_location_screen.dart';
import 'package:alps2alps/presentation/widgets/custom_app_bar.dart';
import 'package:design/design.dart' as design;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => MainScreen(),
      settings: const RouteSettings(),
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final _dateFormat = DateFormat('d MMMM yyyy, HH:mm');

  late final MainScreenBloc _mainScreenBloc;

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
              appBar: CustomAppBar(
                title: 'Find Your Ski Transfer & Book Online',
              ),
              backgroundColor: design.AppColorsTokens.background02,
              body: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(design.AppSpacingTokens.four),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: design.AppSpacingTokens.four,
                          ),
                          child: ElevatedButton(
                            onPressed:
                                () => _mainScreenBloc.add(RemovePassengers()),
                            child: Text('-'),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Passengers: ${state.passengersCount}',
                              style: design.AppTextStylesTokens.heading03(
                                color: design.AppColorsTokens.text04,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: design.AppSpacingTokens.four,
                          ),
                          child: ElevatedButton(
                            onPressed:
                                () => _mainScreenBloc.add(AddPassengers()),
                            child: Text('+'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(design.AppSpacingTokens.four),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: design.AppSpacingTokens.one,
                                ),
                                child: Text(
                                  'Date & Time',
                                  style: design.AppTextStylesTokens.heading03(
                                    color: design.AppColorsTokens.text04,
                                  ),
                                ),
                              ),
                              Text(
                                state.time == null
                                    ? 'No set'
                                    : _dateFormat.format(state.time!),
                                style: design.AppTextStylesTokens.heading04(
                                  color: design.AppColorsTokens.text04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: design.AppSpacingTokens.four,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              final result = await _pickDateTime(context);
                              if (result != null) {
                                _mainScreenBloc.add(SetTime(time: result));
                              }
                            },
                            child: Text(state.time == null ? 'Set' : 'Change'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(design.AppSpacingTokens.four),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: design.AppSpacingTokens.one,
                                ),
                                child: Text(
                                  'Pick-Up Location',
                                  style: design.AppTextStylesTokens.heading03(
                                    color: design.AppColorsTokens.text04,
                                  ),
                                ),
                              ),
                              Text(
                                state.pickupLocation == null
                                    ? 'No set'
                                    : state.pickupLocation.toString(),
                                style: design.AppTextStylesTokens.heading04(
                                  color: design.AppColorsTokens.text04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: design.AppSpacingTokens.four,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              final result = await Navigator.of(
                                context,
                                rootNavigator: true,
                              ).push(
                                SelectLocationScreen.route(
                                  title: 'Pick-Up Location',
                                ),
                              );

                              if (result is LatLng) {
                                _mainScreenBloc.add(
                                  SetPickupLocation(location: result),
                                );
                              }
                            },
                            child: Text(
                              state.pickupLocation == null ? 'Set' : 'Change',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(design.AppSpacingTokens.four),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: design.AppSpacingTokens.one,
                                ),
                                child: Text(
                                  'Drop-Off Destination',
                                  style: design.AppTextStylesTokens.heading03(
                                    color: design.AppColorsTokens.text04,
                                  ),
                                ),
                              ),
                              Text(
                                state.destinationLocation == null
                                    ? 'No set'
                                    : state.destinationLocation.toString(),
                                style: design.AppTextStylesTokens.heading04(
                                  color: design.AppColorsTokens.text04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: design.AppSpacingTokens.four,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              final result = await Navigator.of(
                                context,
                                rootNavigator: true,
                              ).push(
                                SelectLocationScreen.route(
                                  title: 'Drop-Off Destination',
                                ),
                              );

                              if (result is LatLng) {
                                _mainScreenBloc.add(
                                  SetDestinationLocation(location: result),
                                );
                              }
                            },
                            child: Text(
                              state.destinationLocation == null
                                  ? 'Set'
                                  : 'Change',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
                padding: EdgeInsets.all(design.AppSpacingTokens.four),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed:
                            state.isFilled
                                ? () => _mainScreenBloc.add(FindTransport())
                                : null,
                        child: Text('Find transport'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<DateTime?> _pickDateTime(BuildContext context) async {
    // Select date
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return null;

    if (context.mounted) {
      // Select time
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime == null) return null;

      // Combine date and time
      return DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }

    return null;
  }
}
