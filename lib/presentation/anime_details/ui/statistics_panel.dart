import 'package:flutter/material.dart';

import '../models/statistics_anime_ui_model.dart';

class StatisticsPanel extends StatelessWidget {
  final List<StatisticsAnimeUiModel> items;

  const StatisticsPanel({super.key, required this.items});

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Statistics',
              style: TextStyle(
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
    super.key,
    required this.title,
    required this.value,
    required this.progress,
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
