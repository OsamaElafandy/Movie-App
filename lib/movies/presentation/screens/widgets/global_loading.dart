import 'package:flutter/material.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.white,
      backgroundColor: Colors.blueGrey,
      valueColor: AlwaysStoppedAnimation(
        Colors.white,
      ),
    ));
  }
}
