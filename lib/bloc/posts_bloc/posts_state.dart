import 'package:bloc_test/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_test/models/response/Posts_model.dart';
import 'package:bloc_test/models/response/posts_list_model.dart';
import 'package:equatable/equatable.dart';

class PostsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsErrorState extends PostsState {
  final String error;

  PostsErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

class PostLoaded extends PostsState {
  final PostsModel post;
  PostLoaded(this.post);

  @override
  List<Object?> get props => [post];
}

class PostListLoaded extends PostsState {
  final PostsList postList;
  PostListLoaded(this.postList);

  @override
  List<Object?> get props => [postList];
}
