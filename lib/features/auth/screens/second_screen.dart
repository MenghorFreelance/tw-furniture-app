import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../controllers/date_controller.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataController>(); // GetX controller

    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text('Counter: ${controller.counter.value}');
            }),
            ElevatedButton(
              onPressed: () {
                controller.increment(); // Increment counter
              },
              child: const Text('Increment Counter'),
            ),
            ElevatedButton(
              onPressed: () {
                context.pop(); // Go back using GoRouter
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
