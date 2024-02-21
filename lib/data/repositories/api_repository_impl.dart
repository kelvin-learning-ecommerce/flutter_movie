import 'package:injectable/injectable.dart';

import '../../domain/models/response/news_response.dart';
import '../../domain/repositories/api_repository.dart';
import 'base/api_service.dart';

@Injectable(as: ApiRepository)
class ApiRepositoryImpl implements ApiRepository {
  ApiRepositoryImpl({required this.baseService});

  final ApiService baseService;

  @override
  Future<NewsResponse> fetchNews({String? q, required int page}) async {
    var res = await baseService.fetchNews(url: "everything", q: q ?? "", page: page);
    return NewsResponse.fromJson(res);
  }
}
