// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc
import "bloc/posts_bloc.dart";
import "../../navigation/nav_cubit.dart";

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is LoadingPostsState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedPostsState) {
          return RefreshIndicator(
            onRefresh: () async =>
                BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent()),
            child: ListView.builder(
              itemCount: state.posts.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () =>
                        BlocProvider.of<NavCubit>(context).showPostDetails(
                      state.posts[index],
                    ),
                    title: Text(
                      state.posts[index].title,
                    ),
                    subtitle: Text(state.posts[index].userId.toString()),
                  ),
                );
              },
            ),
          );
        } else if (state is ErrorLoadingPostsState) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.error.toString(),
                  ),
                  const SizedBox(height: 20.0),
                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<PostsBloc>(context).add(LoadPostsEvent());
                    },
                    child: const Text(
                      "Try again",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
