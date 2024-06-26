import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/user_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/popups/show_popups.dart';

class ProfileScreenController extends GetxController {
  final UserController _userController = Get.find();

  UserObject? get user => _userController.user;
  final RxList<PostObject> _postList = RxList.empty();
  List<PostObject> get postList => _postList;

  @override
  Future<void> onInit() async {
    _postList.value = await _userController.getMyPosts();
    super.onInit();
  }

  void showFollowingsPopup() {
    if (user != null) {
      ShowPopups().showFollowingsPopup(user!);
    }
  }

  void showFollowersPopup() {
    if (user != null) {
      ShowPopups().showFollowersPopup(user!);
    }
  }
}
