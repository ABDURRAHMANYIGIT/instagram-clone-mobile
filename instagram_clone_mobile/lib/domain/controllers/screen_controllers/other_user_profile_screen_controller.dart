import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/user_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/popups/show_popups.dart';

class OtherUserProfileScreenController extends GetxController {
  OtherUserProfileScreenController(this.userId);
  final int userId;
  final UserController _userController = Get.find();
  final PostController _postController = Get.find();
  final Rxn<UserObject> _user = Rxn();
  UserObject? get user => _user.value;
  final RxList<PostObject?> _postList = RxList.empty();
  List<PostObject?> get postList => _postList;
  final RxInt _currentPage = RxInt(1);
  int get currentPage => _currentPage.value;

  @override
  Future<void> onInit() async {
    _user.value = await _userController.getUserById(userId: userId);
    await _postController.loadPosts(
        currentPage: _currentPage.value, userId: userId);
    _postList.value = _postController.postObjectList;
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
