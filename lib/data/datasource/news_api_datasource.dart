import 'package:hikki_enciclopedia/domain/model/news_entity.dart';
import 'package:result_type/result_type.dart';

import '../../domain/model/error_entity.dart';

abstract class NewsApiDataSource {
  Future<Result<List<NewsEntity>, ErrorEntity>> getNewsList();
}
