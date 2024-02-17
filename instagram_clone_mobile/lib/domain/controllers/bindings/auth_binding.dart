import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
