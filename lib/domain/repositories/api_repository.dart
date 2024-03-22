import '../models/response/movie_response.dart';

abstract class ApiRepository {
  Future<MovieResponse> fetchMovie({required String q});
}
