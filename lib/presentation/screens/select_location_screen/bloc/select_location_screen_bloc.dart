import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'select_location_screen_event.dart';

part 'select_location_screen_state.dart';

class SelectLocationScreenBloc
    extends Bloc<SelectLocationScreenEvent, SelectLocationScreenState> {
  SelectLocationScreenBloc() : super(SelectLocationScreenState()) {
    // TODO: need init
  }
}
