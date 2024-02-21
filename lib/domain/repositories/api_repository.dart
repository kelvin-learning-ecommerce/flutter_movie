import '../models/response/news_response.dart';

abstract class ApiRepository {
  Future<NewsResponse> fetchNews({String q, required int page});
}
