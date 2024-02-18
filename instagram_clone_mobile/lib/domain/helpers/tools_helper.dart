import 'dart:developer';

import 'package:instagram_clone_mobile/presentation/global_components/message_dialog.dart';

class Tools {
  static String getFormattedDuration(Duration value) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(value.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(value.inSeconds.remainder(60));
    final String twoDigitHours = twoDigits(value.inHours);

    return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
  }

  void handleError(
      {required Map<String, dynamic> body, bool showError = true}) {
    if (body['message'] != null) {
      if (showError) {
        return showMessageDialog(
            title: 'Hata', body: body['message'] as String);
      } else {
        log(body['message'] as String);
      }
    } else {
      dynamic errorList;
      if (body['errors'] is List) {
        errorList = body['errors'] as List<dynamic>;
      } else {
        errorList = body['message'];
      }
      errorList = List.castFrom(errorList as List<dynamic>);
      if (errorList.isNotEmpty) {
        String message = '';
        if (errorList is List<Map<String, dynamic>>) {
          for (int i = 0; i < errorList.length; i++) {
            if (errorList[i].values is List) {
              for (int j = 0; j < errorList[i].values.length; j++) {
                final String val_ = errorList[i].values as String;
                message += '$val_.';
              }
            }
          }
          // ignore: unnecessary_type_check
        } else if (errorList is List) {
          for (final dynamic item in errorList) {
            String item_ = '[ERROR]\n';
            if (item is String) {
              item_ = item;
            } else if (item is Map<String, dynamic>) {
              for (final String key in item.keys) {
                if (item[key] is String) {
                  item_ += '${item[key]}\n';
                }
              }
            } else {
              item_ = '$item';
            }

            message += '$item_.';
          }
        }
        if (showError) {
          return showMessageDialog(title: 'Hata', body: message);
        } else {
          log(message);
        }
      } else {
        if (showError) {
          return showMessageDialog(
            title: 'Hata',
            body: 'Bir şeyler yanlış gitti!',
          );
        } else {
          log('Undefined error from handle error method');
        }
      }
    }
  }
}
