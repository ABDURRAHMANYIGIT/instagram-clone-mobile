import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';

class PostListingScreenController extends GetxController {
  PostListingScreenController(this.postList);
  final PostController postController = Get.find();
  final RxInt _currentPage = RxInt(1);
  int get currentPage => _currentPage.value;
  final List<PostObject> postList;

  @override
  Future<void> onInit() async {
    await loadPosts();
    super.onInit();
  }

  Future<void> loadPosts() async {
    await postController.loadPosts(currentPage: currentPage);
    update();
  }
}
