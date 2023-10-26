import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/domain/model/anime_entity.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';
import 'package:hikki_enciclopedia/ui/anime_pager_item.dart';
import 'package:hikki_localization/hikki_localization.dart';

class HorizontalListWithState extends StatelessWidget {
  final List<AnimeEntity> list;
  final bool isError;
  final Object? error;

  const HorizontalListWithState({
    required this.list,
    required this.isError,
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const height = 210.0;
    return SizedBox(
      height: height,
      child: list.isNotEmpty
          ? ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: list.map(
                (element) {
                  return AnimePagerItem(
                    id: element.id,
                    title: element.title,
                    type: element.type,
                    score: element.score,
                    imageUrl: element.imageUrl,
                    onAnimeDetailsClicked: (id) {
                      context.pushRoute(AnimeDetailsRoute(id: id));
                    },
                    height: 210,
                  );
                },
              ).toList(),
            )
          : isError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                            '${LocaleKeys.generalError.tr(context: context)} $error'),
                      ),
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
