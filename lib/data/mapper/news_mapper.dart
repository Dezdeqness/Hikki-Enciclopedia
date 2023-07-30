import 'package:html/parser.dart';
import 'package:html/dom.dart';

import '../../domain/model/news_entity.dart';

class NewsMapper {
  List<NewsEntity> map(String data) => _getListElements(data).map((element) {
        final title = _getTitleText(element);
        final description = _getDescriptionText(element);
        final newsUrl = _getNewUrlText(element);
        final imgUrl = _getImageUrlText(element);

        final newsEntity = NewsEntity(
          title: title,
          description: description,
          imageUrl: imgUrl,
          url: newsUrl,
        );
        return newsEntity;
      }).toList();

  List<Element> _getListElements(String data) {
    final document = parse(data);
    final myAnimeList = document.getElementById("myanimelist");
    final documentWrapper =
        parse(myAnimeList?.getElementsByClassName("wrapper")[0].outerHtml);
    final contentWrapper = documentWrapper.getElementById('contentWrapper');
    final documentContentWrapper = parse(contentWrapper?.outerHtml);
    final newsContentBlock = documentContentWrapper.getElementById('content');
    final contentLeft =
        newsContentBlock?.getElementsByClassName("content-left");
    final scrollFix =
        contentLeft?[0].getElementsByClassName("js-scrollfix-bottom-rel");
    final newsListM =
        scrollFix?[0].getElementsByClassName("news-list mt16 mr8");
    return newsListM?[0].getElementsByClassName("news-unit clearfix rect") ??
        [];
  }

  String _getImageUrlText(Element element) {
    final a = element.getElementsByTagName("a");
    return a[0].getElementsByTagName("img")[0].attributes['src'] ?? '';
  }

  String _getTitleText(Element element) {
    final list = element.getElementsByClassName("news-unit-right");
    final titleClass = list[0].getElementsByClassName("title");
    return titleClass[0].getElementsByTagName("a")[0].text;
  }

  String _getNewUrlText(Element element) {
    final list = element.getElementsByClassName("news-unit-right");
    final titleClass = list[0].getElementsByClassName("title");
    return titleClass[0].getElementsByTagName("a")[0].attributes['href'] ?? '';
  }

  String _getDescriptionText(Element element) {
    final list = element.getElementsByClassName("news-unit-right");
    return list[0].getElementsByClassName("text")[0].text.trimLeft();
  }
}
