// Dart
import 'dart:convert';

// Packages
import 'package:http/http.dart' as http;

// Models
import '../models/post.dart';

class DataService {
  final String _apiBaseUrl = "jsonplaceholder.typicode.com";

  Future<List<Post>> getPosts() async {
    try {
      final uri = Uri.https(_apiBaseUrl, "/posts");
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final List<Post> posts =
            json.map((jsonPost) => Post.fromJson(jsonPost)).toList();
        posts.shuffle();
        return posts;
      } else {
        throw "Error: Request failed. API response status code: ${response.statusCode}";
      }
    } catch (e) {
      rethrow;
    }
  }
}
