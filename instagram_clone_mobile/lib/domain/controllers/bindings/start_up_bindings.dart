import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/bindings/auth_binding.dart';

class StartupBindings extends Bindings {
  @override
  void dependencies() {
    AuthBinding().dependencies();
  }
}
