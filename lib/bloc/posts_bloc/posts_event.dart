import 'package:equatable/equatable.dart';

class PostsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FetchPostsEvent extends PostsEvent {}

class FetchPostsListEvent extends PostsEvent {}
