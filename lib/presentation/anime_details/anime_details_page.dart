import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/core/ui/loading_screen.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_details_use_case.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/components/index.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/composer/anime_details_composer.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/cubit/anime_details_cubit.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/cubit/anime_details_state.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class AnimeDetailsPage extends StatelessWidget {
  final int id;

  const AnimeDetailsPage({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeDetailsCubit>(
      create: (context) => AnimeDetailsCubit(
        useCase: context.read<GetAnimeDetailsUseCase>(),
        composer: context.read<AnimeDetailsComposer>(),
      ),
      child: Builder(builder: (context) {
        return BlocConsumer<AnimeDetailsCubit, AnimeDetailsState>(
          bloc: context.read<AnimeDetailsCubit>()..fetchAnimeDetails(id),
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: state.isLoading
                  ? const LoadingScreen()
                  : state.isError
                      ? ErrorScreen(error: state.error)
                      : CallbackScrollView(
                          onTransparentToolbarChanged:
                              (isTransparentToolbarChanged) {
                            context
                                .read<AnimeDetailsCubit>()
                                .onTransparentToolbarChanged(
                                  isTransparentToolbarChanged,
                                );
                          },
                          isTransparentToolbar: state.isTransparentToolbar,
                          children: [
                            DetailsDynamicToolbar(
                              isTransparentToolbar: state.isTransparentToolbar,
                              title: state.title,
                              onPressed: () {
                                Share.share('https://myanimelist.net/anime/${state.info.id}');
                              },
                            ),
                            SliverToBoxAdapter(
                              child: MainImageWithScore(
                                score: state.info.score,
                                imageUrl: state.info.imageUrl,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: Text(
                                  state.info.title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            if (state.info.briefItems.isNotEmpty)
                              SliverToBoxAdapter(
                                child: BriefInfoCarousel(
                                  items: state.info.briefItems,
                                ),
                              ),
                            if (state.info.synopsis.isNotEmpty)
                              SliverToBoxAdapter(
                                child: ExpandedDescription(
                                  text: state.info.synopsis,
                                  textPadding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  textStyle:
                                      const TextStyle(color: Colors.black),
                                ),
                              ),
                            if (state.info.genres.isNotEmpty == true)
                              SliverToBoxAdapter(
                                child: GenreCarousel(items: state.info.genres),
                              ),
                            if (state.info.relatedAnime.isNotEmpty == true)
                              SliverToBoxAdapter(
                                child: RelatedCarousel(
                                  items: state.info.relatedAnime,
                                ),
                              ),
                            if (state.info.screenshots.isNotEmpty == true)
                              SliverToBoxAdapter(
                                child: ScreenshotCarousel(
                                    items: state.info.screenshots),
                              ),
                            if (state.info.recommendations.isNotEmpty == true)
                              SliverToBoxAdapter(
                                child: RecommendCarousel(
                                  items: state.info.recommendations,
                                ),
                              ),
                            SliverToBoxAdapter(
                              child: StatisticsPanel(items: state.info.stats),
                            ),
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 100,
                              ),
                            ),
                          ],
                        ),
            );
          },
        );
      }),
    );
  }
}
