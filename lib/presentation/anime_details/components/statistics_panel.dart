import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/statistics_anime_ui_model.dart';
import 'package:hikki_localization/hikki_localization.dart';

class StatisticsPanel extends StatelessWidget {
  final List<StatisticsAnimeUiModel> items;

  const StatisticsPanel({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = items
        .map(
          (e) => StatisticsItem(
            title: e.title,
            value: e.value,
            progress: e.progress,
          ),
        )
        .toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LocaleKeys.animeDetailStats.tr(context: context),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: widgets,
        ),
      ],
    );
  }
}

class StatisticsItem extends StatelessWidget {
  final String title;
  final String value;
  final double progress;

  const StatisticsItem({
    required this.title,
    required this.value,
    required this.progress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Flexible(
                flex: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(title),
                ),
              ),
              Flexible(
                flex: 50,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(value),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: LinearProgressIndicator(
            value: progress,
          ),
        ),
      ],
    );
  }
}
