import 'package:flutter/material.dart';

class Loadingcenter extends StatelessWidget {
  const Loadingcenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
