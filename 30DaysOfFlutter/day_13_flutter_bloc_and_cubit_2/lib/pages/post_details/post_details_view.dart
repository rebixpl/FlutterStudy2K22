// Packages
import 'package:flutter/material.dart';

// Models
import '../../models/post.dart';

class PostDetailsView extends StatelessWidget {
  final Post post;
  const PostDetailsView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Text(post.body),
      ),
    );
  }
}
