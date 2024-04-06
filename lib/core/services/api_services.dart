import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:insights_news/core/constants/constants.dart';
import 'package:insights_news/features/home/model/new_model/new_model.dart';

class ApiServices {
  static Future<NewModel?> getNewByCategory(String category) async {
    try {
      var url = Uri.parse(
          '$baseUrl$headlineEndpoint?country=us&category=$category&apiKey=$apiKey');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return NewModel.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<NewModel?> getNewBySearch(String query) async {
    try {
      var url = Uri.parse('$baseUrl$headlineEndpoint?q=$query&apiKey=$apiKey');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return NewModel.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<NewModel?> getNewBySource(String source) async {
    try {
      var url =
          Uri.parse('$baseUrl$headlineEndpoint?source=$source?&apiKey=$apiKey');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return NewModel.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<NewModel?> getSources() async {
    try {
      var url = Uri.parse('$baseUrl$headlineEndpoint?sources=&apiKey=$apiKey');
      var res = await http.get(url);
      if (res.statusCode == 200) {
        return NewModel.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
