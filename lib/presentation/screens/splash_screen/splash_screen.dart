import 'package:alps2alps/general/constants.dart';
import 'package:alps2alps/presentation/screens/main_screen/main_screen.dart';
import 'package:alps2alps/presentation/screens/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:design/design.dart' as design;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashScreenBloc _bloc;

  @override
  void initState() {
    _bloc = SplashScreenBloc(splashScreenDelay: Constants.splashScreenDelay)
      ..add(const Initialize());

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: Key('SplashScreen'),
      create: (_) => _bloc,
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listenWhen: (previous, current) {
          return current.loadingState == SplashScreenLoadingState.completed;
        },
        listener: (context, state) {
          Navigator.of(
            context,
            rootNavigator: true,
          ).pushReplacement(MainScreen.route());
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: design.AppOverlayStyleTokens.splashOverlayStyle,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: design.AppColorsTokens.background01,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
            ),
            body: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Alps',
                      style: design.AppTextStylesTokens.heading01(
                        color: design.AppColorsTokens.text01,
                      ),
                    ),
                    TextSpan(
                      text: ' 2 ',
                      style: design.AppTextStylesTokens.heading01(
                        color: design.AppColorsTokens.text02,
                      ),
                    ),
                    TextSpan(
                      text: 'Alps',
                      style: design.AppTextStylesTokens.heading01(
                        color: design.AppColorsTokens.text01,
                      ),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
