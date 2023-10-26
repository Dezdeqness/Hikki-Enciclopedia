import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import 'package:hikki_ui_kit/hikki_ui_kit.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String url;
  final double height;

  const NewsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.height,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        surfaceTintColor: Colors.transparent,
        child: InkWellWrapper(
          onTap: () async {
            final theme = Theme.of(context);
            try {
              await launch(
                url,
                customTabsOption: CustomTabsOption(
                  toolbarColor: theme.primaryColor,
                  enableDefaultShare: true,
                  enableUrlBarHiding: true,
                  showPageTitle: true,
                ),
              );
            } catch (e) {
              debugPrint(e.toString());
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                width: 120,
                height: height,
                imageUrl,
                fit: BoxFit.fitWidth,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return SizedBox(
                    width: 120,
                    height: height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: context.textTheme.d2
                            .copyWith(color: context.colors.primaryDark),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 8.0),
                      Expanded(
                        child: Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          textAlign: TextAlign.start,
                          style: context.textTheme.h2
                              .copyWith(color: context.colors.primaryDark500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
