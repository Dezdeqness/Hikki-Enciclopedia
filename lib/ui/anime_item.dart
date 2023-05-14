import 'package:flutter/material.dart';

class AnimeItem extends StatelessWidget {
  final String title;
  final double score;
  final String imageUrl;
  final String genres;

  const AnimeItem({
    super.key,
    required this.title,
    required this.score,
    required this.imageUrl,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Stack(children: [
                Image.network(
                  imageUrl,
                  width: 300,
                  height: 450,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          score.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
