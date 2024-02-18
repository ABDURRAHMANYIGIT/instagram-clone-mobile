import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PostController>(PostController(), permanent: true);
  }
}
