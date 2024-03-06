import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';

class PostListingScreenController extends GetxController {
  final PostController postController = Get.find();
  final RxInt _currentPage = RxInt(1);
  int get currentPage => _currentPage.value;
  final RxList<PostObject> _postList = RxList.empty();
  List<PostObject> get postList => _postList;

  Future<void> loadPosts() async {
    await postController.loadPosts(currentPage: currentPage);
    _currentPage.value++;
    update();
  }
}
