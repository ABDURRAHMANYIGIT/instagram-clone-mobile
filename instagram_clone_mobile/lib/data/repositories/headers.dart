part of 'api.dart';

class _Headers {
  Map<String, String> getHeaderWithAuthToken(String token) {
    return <String, String>{
      'Authorization': token,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    };
  }

  Map<String, String> getHeaderUnauth() {
    return <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Requested-With': 'XMLHttpRequest'
    };
  }
}
