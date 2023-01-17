class Urls {
  static const String baseUrl = "https://api.seatgeek.com/2";
  static const String clientId = "MzE0NzIxNjR8MTY3MzYyNDgzNi40MTc4OTM";
  static String eventsListUrl(String? query) =>
      query != null ? '$baseUrl/events?client_id=$clientId&q=$query' : '$baseUrl/events?client_id=$clientId';
}

class ResponseCodeConsts {
  static const int successStatusCode = 200;
}
