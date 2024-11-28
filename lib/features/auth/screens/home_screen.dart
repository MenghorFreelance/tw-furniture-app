import 'package:flutter/material.dart';
import 'package:flutter_tem/components/image/cash_image.dart';
import 'package:get/get.dart';

import '../controllers/date_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataController photoController = Get.put(DataController());

  @override
  void initState() {
    super.initState();
    photoController.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Obx(() {
        // Check if loading is true
        if (photoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Check if there's an error
        if (photoController.errorMessage.isNotEmpty) {
          return Center(child: Text(photoController.errorMessage.value));
        }

        // If photos are loaded successfully, display them
        return ListView.builder(
          itemCount: photoController.photos.length,
          itemBuilder: (context, index) {
            var photo = photoController.photos[index];
            return ListTile(
              title: Text(photo.title),
              leading: CashImage(
                imageUrl: photo.thumbnailUrl,
                width: 50,
                height: 50,
              ),
            );
          },
        );
      }),
    );
  }
}
