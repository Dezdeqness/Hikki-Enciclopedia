import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/domain/model/personal_list_type.dart';
import 'package:hikki_enciclopedia/domain/model/personal_page_type.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';
import 'package:hikki_enciclopedia/presentation/personal/components/personal_item.dart';
import 'package:hikki_enciclopedia/presentation/personal/components/personal_shimmer.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab_status.dart';
import 'package:hikki_enciclopedia/presentation/personal/provider/personal_providers.dart';

import 'components/personal_ribbon.dart';

class PersonalTab extends ConsumerStatefulWidget {
  final PersonalPageType type;

  const PersonalTab({super.key, required this.type});

  @override
  ConsumerState<PersonalTab> createState() => _PersonalTabState();
}

class _PersonalTabState extends ConsumerState<PersonalTab> {
  final ScrollController _scrollController = ScrollController();

  bool _loadingNextPage = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.9 &&
          !_loadingNextPage) {
        _loadingNextPage = true;
        await ref
            .read(personalNotifierProvider(widget.type).notifier)
            .fetchNextPage();
        _loadingNextPage = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(personalNotifierProvider(widget.type));
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: PersonalRibbon(
            selected: state.type,
            onChanged: (type) {
              ref
                  .read(personalNotifierProvider(widget.type).notifier)
                  .switchTab(type);
            },
          ),
        ),
      ),
      body: RefreshIndicator(
          child: Builder(builder: (context) {
            final status = state.status;
            if (status is Loading || status is Initial) {
              return const PersonalShimmer();
            }

            if (status is Error) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverFillRemaining(
                      child: ErrorScreen(error: status.error.toString())),
                ],
              );
            }

            final additionalItem = state.isLoadingMore ? 1 : 0;

            return ListView.builder(
                controller: _scrollController,
                itemCount: state.items.length + additionalItem,
                itemBuilder: (BuildContext context, int index) {
                  if (index < state.items.length) {
                    return PersonalCell(
                      item: state.items[index],
                      onTap: (id) {
                        final PageRouteInfo route;
                        if (state.type == PersonalListType.tv) {
                          route = TvDetailsRoute(id: id);
                        } else {
                          route = MovieDetailsRoute(id: id);
                        }
                        context.pushRoute(route);
                      },
                    );
                  } else {
                    return PersonalShimmer(placeholderCount: 1);
                  }
                });
          }),
          onRefresh: () => ref
              .read(personalNotifierProvider(widget.type).notifier)
              .refresh()),
    );
  }
}
