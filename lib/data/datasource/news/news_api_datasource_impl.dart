import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/news/news_api_datasource.dart';
import 'package:hikki_enciclopedia/domain/model/news_entity.dart';
import 'package:result_type/result_type.dart';
import 'package:hikki_enciclopedia/data/core/index.dart';
import 'package:hikki_enciclopedia/data/mapper/index.dart';

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
