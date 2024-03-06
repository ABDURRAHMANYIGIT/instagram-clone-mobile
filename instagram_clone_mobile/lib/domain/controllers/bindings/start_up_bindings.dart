import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/bindings/auth_binding.dart';
import 'package:instagram_clone_mobile/domain/controllers/bindings/post_binding.dart';
import 'package:instagram_clone_mobile/domain/controllers/bindings/user_binding.dart';

class StartupBindings extends Bindings {
  @override
  void dependencies() {
    AuthBinding().dependencies();
    UserBinding().dependencies();
    PostBinding().dependencies();
  }
}
