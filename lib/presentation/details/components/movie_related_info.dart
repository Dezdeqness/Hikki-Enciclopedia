import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/details/models/movie_details_ui_item.dart';
import 'package:hikki_localization/hikki_localization.dart';

class MovieRelatedInfo extends StatelessWidget {
  final MovieDetailsUiItem item;

  const MovieRelatedInfo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _RelatedInfoItem(
                title: LocaleKeys.statusTitle.tr(), value: item.status),
            _RelatedInfoItem(
                title: LocaleKeys.nameTitle.tr(), value: item.originalTitle),
            _RelatedInfoItem(
                title: LocaleKeys.languageTitle.tr(),
                value: item.originalLanguage),
            _RelatedInfoItem(
                title: LocaleKeys.countryTitle.tr(),
                value: item.originCountry.first),
          ],
        ),
      ),
    );
  }
}

class _RelatedInfoItem extends StatelessWidget {
  final String title;
  final String value;

  const _RelatedInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    if (value.isEmpty) return SizedBox.shrink();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 30,
          fit: FlexFit.tight,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 70,
          child: Text(
            value,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
