/// Created by JAI
class EndPoint{
  // base url
//  static const String baseUrl = "http://jsonplaceholder.typicode.com";
  static const String baseUrl = "https://cricket.sportmonks.com/api/v2.0/";
//  http://10.37.54.123:9909/api/v1/login
  // receiveTimeout
  static const int receiveTimeout = 5000;

  // connectTimeout
  static const int connectionTimeout = 3000;

  // booking endpoints
  static const String players = baseUrl + "players";
  static const String teams = baseUrl + "teams";
}
