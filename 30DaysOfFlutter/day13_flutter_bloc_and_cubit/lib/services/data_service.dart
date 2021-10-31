// Dart
import 'dart:convert';

// Packages
import 'package:http/http.dart' as http;

// Models
import '../models/post.dart';

class DataService {
  final _baseUrl = "jsonplaceholder.typicode.com";

  Future<List<Post>> getPosts() async {
    try {
      final uri = Uri.https(_baseUrl, "/posts");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final posts = json.map((postJson) => Post.fromJson(postJson)).toList();
        return posts;
      } else {
        throw ('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      rethrow;
    }
  }
}
