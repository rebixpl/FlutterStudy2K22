// Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Services
import '../../../services/data_service.dart';

// Models
import "../../../models/post.dart";

// CUBIT
class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}

// BLOC
abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

class RefreshPostsEvent extends PostsEvent {}

abstract class PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  final List<Post> posts;
  LoadedPostsState({required this.posts});
}

class ErrorLoadingPostsState extends PostsState {
  final Object error;
  ErrorLoadingPostsState({required this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();

  PostsBloc() : super(LoadingPostsState()) {
    on<LoadPostsEvent>((event, emit) {
      emit(LoadingPostsState());
      _getPosts();
    });

    on<RefreshPostsEvent>((event, emit) {
      _getPosts();
    });
  }

  void _getPosts() async {
    try {
      final posts = await _dataService.getPosts();
      emit(LoadedPostsState(posts: posts));
    } catch (e) {
      emit(ErrorLoadingPostsState(error: e));
    }
  }
}
