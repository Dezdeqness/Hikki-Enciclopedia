import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

class VideoMapper {
  VideoEntity toEntity(Video video) => VideoEntity(
        id: video.id,
        name: video.name,
        size: video.size,
        previewImageUrl: TMDBConstants.youtubePreviewPath +
            video.key +
            TMDBConstants.youtubePreviewEndPath,
        site: video.site,
        type: video.type,
        official: video.official,
      );
}
