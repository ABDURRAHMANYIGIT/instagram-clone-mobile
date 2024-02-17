import 'dart:io';

import 'package:flutter/foundation.dart';

class AppLogic {
  static const bool isTestServer =
      kDebugMode; // TODO(ALL): Change with live server

  static const String testServer = 'https://dev.commonground.app/api';
  static const String liveServer = 'https://commonground.app/api';
  static const String apiPath = 'api/';

  static const String localPathAndroid = 'http://10.0.2.2:8000/api';
  static const String localPathIOS = 'http://127.0.0.1:8000/api';
  String getApiPath() {
    return isTestServer ? testServer : liveServer;
  }

  String getLocalPath() {
    return Platform.isAndroid ? localPathAndroid : localPathIOS;
  }
}
