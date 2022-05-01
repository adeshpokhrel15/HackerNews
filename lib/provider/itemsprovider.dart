import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:newshacker/model/items.dart';

final newsProvider =
    StateNotifierProvider<NewsProvider, List<items>>((ref) => NewsProvider());
List<items> storylist = [];
late List idlist = [];

class NewsProvider extends StateNotifier<List<items>> {
  NewsProvider() : super([]) {
    getStories();
  }
  Future<void> getStories() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty");
      //print(response);
      idlist = response.data;
      for (int i = 0; i < 20; i++) {
        int id = idlist[i];
        final news = await dio.get(
            "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty");
        Map<String, dynamic> map = news.data;
        final data = items.fromJson(map);
        storylist.add(data);
      }
      state = storylist;
    } on DioError catch (e) {
      print(e);
    }
  }
}
