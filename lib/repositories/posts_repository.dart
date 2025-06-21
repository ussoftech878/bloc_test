import 'dart:convert';

import 'package:bloc_test/models/response/Posts_model.dart';
import 'package:bloc_test/models/response/posts_list_model.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  Future<PostsModel> fetchposts() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
    );

    PostsModel post = PostsModel.fromJson(jsonDecode(response.body));
    return post;
  }

  Future<PostsList> fetchpostsLists() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    final PostsList postsListsresponse = PostsList.fromJson(
      jsonDecode(response.body),
    );
    return postsListsresponse;
  }
}
