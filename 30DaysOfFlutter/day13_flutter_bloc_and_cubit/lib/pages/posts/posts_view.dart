// Packages
import 'package:day13_flutter_bloc_and_cubit/pages/posts/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
              onRefresh: () async => BlocProvider.of<PostsBloc>(context).add(
                PullToRefreshEvent(),
              ),
              child: ListView.builder(
                itemCount: state.posts.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        state.posts[index].title,
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is FailedToLoadPostsState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Error occured: ${state.error}"),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
