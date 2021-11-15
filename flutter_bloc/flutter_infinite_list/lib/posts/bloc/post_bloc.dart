import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/posts/models/post.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

const _postLimit = 20;
const _throttleDuration = Duration(milliseconds: 500);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    // Passing a transformer to on<PostFetched> allows us to customize
    // how events are processed.
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(_throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final List<Post> posts = await _fetchPosts();
        return emit(
          state.copyWith(
            status: PostStatus.success,
            posts: posts,
            hasReachedMax: false,
          ),
        );
      }
      final List<Post> posts = await _fetchPosts(state.posts.length);
      emit(
        posts.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: PostStatus.success,
                posts: state.posts..addAll(posts),
                hasReachedMax: false,
              ),
      );
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    Map<String, String> _queryParams = {
      '_start': '$startIndex',
      '_limit': '$_postLimit'
    };
    String _authority = "jsonplaceholder.typicode.com";
    String _path = "/posts";

    Uri _uri = Uri.https(_authority, _path, _queryParams);

    final response = await httpClient.get(_uri);

    debugPrint(_uri.toString());

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      // Test if will it work without 'return' here
      return body.map(
        (jsonPost) {
          return Post(
            id: jsonPost["id"] as int,
            title: jsonPost["title"] as String,
            body: jsonPost["body"] as String,
          );
        },
      ).toList();
    }
    throw Exception('error fetching posts');
  }
}
