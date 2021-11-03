// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Pages
import '../pages/posts/posts_view.dart';
import '../pages/post_details/post_details_view.dart';

// Navigation
import './nav_cubit.dart';

// Models
import '../models/post.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(builder: (context, post) {
      return Navigator(
        pages: [
          const MaterialPage(child: PostsView()),
          if (post != null)
            MaterialPage(
              child: PostDetailsView(post: post),
            ),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          BlocProvider.of<NavCubit>(context).popToPosts();
          return true;
        },
      );
    });
  }
}
