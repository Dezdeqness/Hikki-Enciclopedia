import 'package:hikki_enciclopedia/core/extensions/response_extension.dart';
import 'package:hikki_enciclopedia/data/datasource/news_api_datasource.dart';
import 'package:hikki_enciclopedia/data/service/news_service.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';
import 'package:hikki_enciclopedia/domain/model/news_entity.dart';
import 'package:result_type/result_type.dart';
import '../core/base_api_datasource.dart';
import '../mapper/error_mapper.dart';
import '../mapper/news_mapper.dart';

class NewsApiDatasourceImpl extends BaseApiDatasource
    implements NewsApiDataSource {
  final NewsService _newsService;
  final NewsMapper _newsMapper;

  NewsApiDatasourceImpl(
    this._newsService,
    this._newsMapper,
    ErrorMapper errorMapper,
  ) : super(errorMapper);

  @override
  Future<Result<List<NewsEntity>, ErrorEntity>> getNewsList() async {
    try {
      final response = await _newsService.getNewsDoc();
      if (response.isSuccessRequest()) {
        return Success(_newsMapper.map(response.data.toString()));
      } else {
        return Failure(ErrorEntity.unknown);
      }
    } on Exception catch (e) {
      return Failure(errorMapper.mapException(e));
    }
  }
}
