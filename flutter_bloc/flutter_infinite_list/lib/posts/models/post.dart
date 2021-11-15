// Packages
import 'package:equatable/equatable.dart';

// [
// { // Post 1
// "id": 1,
// "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
// "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
// },
// { // Post 2
// "id": 2,
// "title": "qui est esse",
// "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
// }
// ]

class Post extends Equatable {
  const Post({required this.id, required this.title, required this.body});

  final int id;
  final String title, body;

  @override
  List<Object?> get props => [id, title, body];
}
