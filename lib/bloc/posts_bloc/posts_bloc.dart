import 'package:bloc_test/bloc/posts_bloc/posts_event.dart';
import 'package:bloc_test/bloc/posts_bloc/posts_state.dart';
import 'package:bloc_test/models/response/Posts_model.dart';
import 'package:bloc_test/models/response/posts_list_model.dart';
import 'package:bloc_test/repositories/posts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;
  PostsBloc(this.postsRepository) : super(PostsInitialState()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(PostsLoadingState());
      try {
        final PostsModel response = await postsRepository.fetchposts();
        emit(PostLoaded(response));
      } catch (e) {
        emit(PostsErrorState(error: e.toString()));
      }
    });

    on<FetchPostsListEvent>((event, emit) async {
      emit(PostsLoadingState());
      try {
        final PostsList response = await postsRepository.fetchpostsLists();
        print(response.posts.length);
        emit(PostListLoaded(await postsRepository.fetchpostsLists()));
      } catch (e) {
        emit(PostsErrorState(error: e.toString()));
      }
    });
  }
}
