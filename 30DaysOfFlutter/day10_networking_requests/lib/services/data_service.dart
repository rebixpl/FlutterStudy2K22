// Packages
import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRequestToAPI() async {
    //https://jsonplaceholder.typicode.com/todos
    const _authority = "jsonplaceholder.typicode.com";
    const _path = "/todos";

    final uri = Uri.https(_authority, _path);
    final response = await http.get(uri);
    return response.body;
  }
}
