import 'package:get/get.dart';

import '../features/auth/controllers/date_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController>(() => DataController());
  }
}
