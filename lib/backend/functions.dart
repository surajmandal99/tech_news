import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_news/components/search_bar.dart';
import 'package:tech_news/utils/key.dart';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=99&apiKey=${Key.key}&q=${MySearchBar.searchcontroller.text}'),
  );
  Map result = jsonDecode(response.body);

  return (result['articles']);
}
