import 'package:flutter/material.dart';

class AppProgressWidget extends StatelessWidget {
  const AppProgressWidget({this.size = 48.0, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
