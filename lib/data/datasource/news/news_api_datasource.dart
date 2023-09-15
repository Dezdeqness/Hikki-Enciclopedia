import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/news_entity.dart';
import 'package:result_type/result_type.dart';


abstract class NewsApiDataSource {
  Future<Result<List<NewsEntity>, ErrorEntity>> getNewsList();
}
