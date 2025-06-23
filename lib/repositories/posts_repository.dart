import 'dart:convert';

import 'package:bloc_test/models/response/Posts_model.dart';
import 'package:bloc_test/models/response/posts_list_model.dart';
import 'package:bloc_test/services/api_base_helper.dart';
import 'package:http/http.dart' as http;

class PostsRepository {

  ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<PostsModel> fetchposts() async {
    final response = await _apiBaseHelper.httpRequest(requestType: 'GET', params: '');

    PostsModel post = PostsModel.fromJson(response);
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
