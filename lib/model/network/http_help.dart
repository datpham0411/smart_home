
import 'package:http/http.dart' as http;

class HttpHelper {
  Future<http.Response> fetchText(String url) async {
    var response = await http.get(Uri.parse(url));
    return response;
  }
}

class NetworkUtils {
  static  isReqSuccess(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return false;
    } else {
      return true;
    }
  }
}