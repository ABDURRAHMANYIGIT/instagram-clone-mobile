import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';

class HomeScreenController extends GetxController {
  final PostController postController = Get.put(PostController());
  final RxInt _currentPage = RxInt(1);
  int get currentPage => _currentPage.value;
  List<PostObject?> get postObjectList => postController.postObjectList;
  List<int?> get likedPostIds => postController.likedPostIds;

  @override
  Future<void> onInit() async {
    await loadPosts();
    super.onInit();
  }

  Future<void> loadPosts() async {
    await postController.loadPosts(currentPage: currentPage);
    update();
  }

  Future<void> likePost({required int id}) async {
    await postController.likePost(id: id);
  }
}
