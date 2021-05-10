// @dart=2.9
import 'dart:convert';
import 'package:http/http.dart';
import 'post_model.dart';

class HttpService {

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Não consegue recuperar as postagens.";
    }
  }
}