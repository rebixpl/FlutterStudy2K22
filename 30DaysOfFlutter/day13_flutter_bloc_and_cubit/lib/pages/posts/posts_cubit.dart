// Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Services
import '../../services/data_service.dart';

// Models
import '../../models/post.dart';

// CUBIT
class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]); // We initialize Cubit in super

  void getPosts() async => emit(await _dataService.getPosts());
}

// BLOC
abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Post> posts;
  LoadedPostsState({required this.posts});
}

class FailedToLoadPostsState extends PostsState {
  Object error;
  FailedToLoadPostsState({required this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  // Constructor
  PostsBloc() : super(LoadingPostsState()) {
    on<LoadPostsEvent>((event, emit) async {
      emit(LoadingPostsState());

      try {
        final posts = await _dataService.getPosts();
        emit(LoadedPostsState(posts: posts));
      } catch (e) {
        emit(FailedToLoadPostsState(error: e));
      }
    });
    on<PullToRefreshEvent>((event, emit) async {
      try {
        final posts = await _dataService.getPosts();
        debugPrint("Posts list has just been refreshed.");
        emit(LoadedPostsState(posts: posts));
      } catch (e) {
        emit(FailedToLoadPostsState(error: e));
      }
    });
  }
}
