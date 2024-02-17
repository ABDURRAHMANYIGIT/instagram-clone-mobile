import 'package:flutter/material.dart';

class InProgressWidget extends StatelessWidget {
  const InProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
