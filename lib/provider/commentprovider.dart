import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshacker/model/comments.dart';

final commentProvider = StateNotifierProvider((ref) => Comments());
final commentP = Provider((ref) => commentlist);
List<comments> commentlist = [];

class Comments extends StateNotifier<List<comments>> {
  Comments() : super([]);

  Future<void> getComment({List? kids}) async {
    final dio = Dio();
    try {
      if (kids != null) {
        for (var i = 0; i < kids.length; i++) {
          int comment = await kids[i];

          final news = await dio.get(
              "https://hacker-news.firebaseio.com/v0/item/$comment.json?print=pretty");

          Map<String, dynamic> map = news.data;
          final data = await comments.fromJson(map);
          commentlist.add(data);
        }
        state = commentlist;
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
