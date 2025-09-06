import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/details/components/index.dart';
import 'package:hikki_enciclopedia/presentation/details/core/base_details_notifier.dart';
import 'package:hikki_enciclopedia/presentation/details/core/base_details_page.dart';
import 'package:hikki_enciclopedia/presentation/details/models/movie_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/providers/movie_details_provider.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';
import 'package:hikki_localization/hikki_localization.dart';

@RoutePage()
class MovieDetailsPage extends BaseDetailsPage<MovieDetailsUiItem> {
  const MovieDetailsPage({super.key, required super.id});

  @override
  AutoDisposeAsyncNotifierProviderFamily<
      BaseDetailsNotifier<MovieDetailsUiItem>,
      MovieDetailsUiItem,
      String> provider() => movieDetailsNotifierProvider;

  @override
  Widget buildBody(MovieDetailsUiItem item, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: MainImageWithScore(
              imageUrl: item.posterPath,
              score: item.voteAverage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              item.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GenreCarousel(items: item.genres),
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.white,
            child: ExpandedDescription(
              text: item.overview,
              textPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              textStyle: const TextStyle(color: Colors.black),
            ),
          ),
          MovieRelatedInfo(item: item),
          GenericDetailsSection<CastDetailsModel>(
            title: LocaleKeys.castSectionTitle.tr(),
            height: 250,
            items: item.casts
                .map(
                  (item) => CastDetailsModel(
                      name: item.originalName,
                      character: item.name,
                      imageUrl: item.profilePath),
                )
                .toList(),
            itemBuilder: (context, item) {
              return SizedBox(
                width: 120,
                child: CastDetailsItem(item: item),
              );
            },
          ),
          GenericDetailsSection<String>(
            title: LocaleKeys.videosSectionTitle.tr(),
            height: 130,
            items: item.videos,
            itemBuilder: (context, item) {
              return VideoDetailsItem(imageUrl: item);
            },
          ),
          GenericDetailsSection<CommonDetailsModel>(
            title: LocaleKeys.recommendSectionTitle.tr(),
            height: 210,
            items: item.recommendations
                .map(
                  (item) => CommonDetailsModel(
                    id: item.id.toString(),
                    title: item.title,
                    imageUrl: item.posterPath,
                  ),
                )
                .toList(),
            itemBuilder: (context, item) {
              return SizedBox(
                width: 120,
                child: CommonDetailsItem(
                  item: item,
                  onTap: (id) => context.pushRoute(MovieDetailsRoute(id: id)),
                ),
              );
            },
          ),
          GenericDetailsSection<CommonDetailsModel>(
            title: LocaleKeys.similarSectionTitle.tr(),
            height: 210,
            items: item.similar
                .map(
                  (item) => CommonDetailsModel(
                    id: item.id.toString(),
                    title: item.title,
                    imageUrl: item.posterPath,
                  ),
                )
                .toList(),
            itemBuilder: (context, item) {
              return SizedBox(
                width: 120,
                child: CommonDetailsItem(
                  item: item,
                  onTap: (id) => context.pushRoute(MovieDetailsRoute(id: id)),
                ),
              );
            },
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
