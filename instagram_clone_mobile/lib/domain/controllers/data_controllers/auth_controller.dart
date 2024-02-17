import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/helpers/shared_preferences.dart';

import '../../../data/models/user_object.dart';
import '../../repositories/index.dart';
import '../../router/router.dart';

enum AuthStatus { auth, notAuth, firstTime }

class AuthController extends GetxController {
  final DatabaseServices _databaseServices = DatabaseServices();
  final Rxn<UserObject> authUser = Rxn<UserObject>();
  final Rx<AuthStatus> authStatus = Rx<AuthStatus>(AuthStatus.notAuth);
  UserObject? get getAuthUser => authUser.value;
  RxnString navigateTo = RxnString();
  final RxBool _redirectOnboarding = RxBool(false);
  bool get redirectOnboarding => _redirectOnboarding.value;
  bool isFirstLogin = false;
  Duration navigateDuration = const Duration(seconds: 2);

  String get avatarFileKey => 'avatar';
  final RxBool _inProgress = RxBool(false);
  bool get inProgress => _inProgress.value;
  @override
  Future<void> onInit() async {
    ever(authStatus, _handleAuthStatusChange);
    ever(navigateTo, _handleNavigateRouteChange);
    _redirectOnboarding.value = await SharedPreference().getSeen();
    if (redirectOnboarding) {
      navigateTo.value = AppRouter.designRoute;
      update();
    }
    ever(authUser, _handleAuthUserChange);
    if (!redirectOnboarding) {
      await getUser();
    }
    super.onInit();
  }

  Future<void> getUser() async {
    _inProgress.value = true;
    authUser.value = await _databaseServices.getUser();
    _inProgress.value = false;
    update();
    await checkAuthStatus();
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    return _databaseServices.login(email: email, password: password);
  }

  Future<void> checkAuthStatus() async {
    if (authUser.value != null) {
      if (isFirstLogin) {
        authStatus.value = AuthStatus.firstTime;
      } else {
        authStatus.value = AuthStatus.auth;
      }
    } else {
      authStatus.value = AuthStatus.notAuth;
    }
    update();
  }

  void logout() {
    authUser.value = null;
    SharedPreference().deleteToken();
    authStatus.value = AuthStatus.notAuth;
    update();
  }

  // TODO(ALL): UPDATE ROUTES
  void _handleAuthStatusChange(AuthStatus event) {
    switch (event) {
      case AuthStatus.auth:
        navigateTo.value = AppRouter.designRoute;

        break;
      case AuthStatus.notAuth:
        navigateTo.value = AppRouter.designRoute;

        break;
      case AuthStatus.firstTime:
        navigateDuration = Duration.zero;
        navigateTo.value = AppRouter.designRoute;
        break;
    }
    update();
  }

  void _handleAuthUserChange(UserObject? event) {
    if (event != null) {
      // It's auth
    } else {
      // Not valid user
    }
    update();
  }

  void _handleNavigateRouteChange(String? event) {
    if (event != null && Get.currentRoute != event) {
      Future<void>.delayed(navigateDuration, () {
        Get.offAllNamed(event);
      });
    }
  }
}
