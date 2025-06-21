class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}

// For a list of posts
class PostsList {
  final List<Post> posts;

  PostsList({required this.posts});

  factory PostsList.fromJson(List<dynamic> jsonList) {
    return PostsList(
      posts: jsonList.map((json) => Post.fromJson(json)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return posts.map((post) => post.toJson()).toList();
  }
}
