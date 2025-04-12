import 'package:alps2alps/presentation/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:design/design.dart' as design;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            value: design.AppOverlayStyleTokens.splashOverlayStyle,
            child: Scaffold(
              backgroundColor: design.AppColorsTokens.background02,
              body: Container(
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
