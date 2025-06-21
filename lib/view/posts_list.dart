import 'package:bloc_test/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_test/bloc/posts_bloc/posts_event.dart';
import 'package:bloc_test/bloc/posts_bloc/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostsBloc>().add(FetchPostsListEvent());
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PostsErrorState) {
            SnackBar(content: Text(state.error));
          }
          if (state is PostListLoaded) {
            return ListView.builder(
              itemCount: state.postList.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.postList.posts[index].title),
                  subtitle: Text(state.postList.posts[index].body),
                );
              },
            );
          }
          return Center(child: Text('nothing found'));
        },
      ),
    );
  }
}
