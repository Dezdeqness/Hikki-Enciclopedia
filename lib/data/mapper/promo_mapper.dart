import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';

class PromoMapper {
  List<PromotionalEntity> map(String data) =>
      _getListElements(data).map((element) {
        final title = _getTitleText(element);
        final description = _getDescriptionText(element);
        final promoUrl = _getPromoUrlText(element);
        final imgUrl = _getImageUrlText(element);

        final newsEntity = PromotionalEntity(
          name: title,
          kind: description,
          imageUrl: imgUrl,
          url: promoUrl,
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

    final clearFix = newsContentBlock
        ?.getElementsByClassName("watch-anime-list watch-video ml12 clearfix");
    final videoBlock = clearFix?[0].getElementsByClassName("video-block");
    return videoBlock?[0].getElementsByClassName("video-list-outer-vertical") ??
        [];
  }

  String _getImageUrlText(Element element) {
    final link = element.getElementsByTagName("a")[0].attributes["href"] ?? '';
    var indexOf = link.indexOf('embed/');
    var lastIndexOf = link.lastIndexOf('?enable');
    final id = link.substring(indexOf + "embed/".length, lastIndexOf);
    const baseUrl = "https://i.ytimg.com/vi/";
    const baseUrlEnd = "/hqdefault.jpg";
    final imageUrl = baseUrl + id + baseUrlEnd;
    return imageUrl;
  }

  String _getTitleText(Element element) {
    final videoInfo = element.getElementsByClassName("video-info-title");
    return videoInfo[0].getElementsByClassName("mr4")[0].text;
  }

  String _getPromoUrlText(Element element) {
    return element.getElementsByTagName("a")[0].attributes["href"] ?? '';
  }

  String _getDescriptionText(Element element) {
    return element.getElementsByTagName("a")[0].attributes["data-title"] ?? '';
  }
}
