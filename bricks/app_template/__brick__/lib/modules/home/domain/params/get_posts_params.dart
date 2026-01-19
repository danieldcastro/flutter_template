class GetPostsParams {
  final int? userId;

  const GetPostsParams({this.userId});

  Map<String, String> toJson() => {
    if (userId != null) 'userId': userId.toString(),
  };
}
