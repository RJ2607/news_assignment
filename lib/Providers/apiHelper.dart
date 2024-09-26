import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_assignment/models/topHeadLinesModel.dart';

import '../Utils/apiEndPoints.dart';

class ApiHelper extends ChangeNotifier {
  Future<TopHeadLinesModel?> getTopHeadlinesCountry(String countryCode) async {
    var url =
        '${ApiEndPoints.baseUrl}/${ApiEndPoints.topHeadlines.getTopHeadlines}?${ApiEndPoints.topHeadlines.country}=$countryCode';
    try {
      var headers = {
        'x-api-key': ApiEndPoints().apiKey,
      };
      var request = http.MultipartRequest('GET', Uri.parse(url));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      TopHeadLinesModel topHeadLinesModel =
          topHeadLinesModelFromJson(await response.stream.bytesToString());

      return topHeadLinesModel;
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }

  topHeadLinesModelFromJson(String str) =>
      TopHeadLinesModel.fromJson(json.decode(str));
}
