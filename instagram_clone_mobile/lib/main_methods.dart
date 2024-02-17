import 'package:flutter/cupertino.dart';
import 'package:instagram_clone_mobile/domain/controllers/bindings/start_up_bindings.dart';

class MainMethods {
  Future<void> runInitialMethods() async {
    WidgetsFlutterBinding.ensureInitialized();
    StartupBindings().dependencies();
  }
}
