import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: true);
  }
}
