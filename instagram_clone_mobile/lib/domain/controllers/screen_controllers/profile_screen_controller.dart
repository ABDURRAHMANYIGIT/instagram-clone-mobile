import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/auth_controller.dart';

class ProfileScreenController extends GetxController {
  final AuthController _authController = Get.find();

  UserObject? get authUser => _authController.getAuthUser;
}
