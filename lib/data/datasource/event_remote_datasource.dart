import 'dart:convert';

import 'package:digital14_demo/data/constants.dart';
import 'package:digital14_demo/data/models/event_model.dart';
import 'package:digital14_demo/data/server_exception.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<Events> getEvents(String? query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<Events> getEvents(String? query) async {
    final response = await http.get(Uri.parse(Urls.eventsListUrl(query)));
    if (response.statusCode == ResponseCodeConsts.successStatusCode) {
      print("API Response:-${response.body}");
      return Events.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
