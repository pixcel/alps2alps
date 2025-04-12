import 'package:domain/domain.dart' as domain;
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.exception,
    required this.onTryAgain,
  });

  final domain.BaseRepositoryException exception;
  final VoidCallback onTryAgain;

  String get _prepareErrorMessage {
    final exception = this.exception;
    if (exception is domain.RepositoryException) {
      return exception.name;
    } else {
      return 'An unexpected error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(child: SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            'Something going wrong',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'Error: $_prepareErrorMessage',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const Expanded(child: SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.only(bottom: 48),
          child: Center(
            child: TextButton(
              onPressed: onTryAgain,
              child: const Text('Try again'),
            ),
          ),
        ),
      ],
    );
  }
}
