import 'package:injectable/injectable.dart';

import '../../domain/models/response/movie_response.dart';
import '../../domain/repositories/api_repository.dart';
import 'base/api_service.dart';

@Injectable(as: ApiRepository)
class ApiRepositoryImpl implements ApiRepository {
  ApiRepositoryImpl({required this.baseService});

  final ApiService baseService;

  @override
  Future<MovieResponse> fetchMovie({required String q}) async {
    var res = await baseService.fetchMovie(q: q);
    return MovieResponse.fromJson(res);
  }
}
