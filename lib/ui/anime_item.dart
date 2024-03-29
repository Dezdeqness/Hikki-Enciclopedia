import 'package:flutter/material.dart';

class AnimeItem extends StatelessWidget {
  final int id;
  final String title;
  final double score;
  final String imageUrl;
  final String genres;
  final ValueChanged<int> onAnimeDetailsClicked;

  const AnimeItem({
    required this.id,
    required this.title,
    required this.score,
    required this.imageUrl,
    required this.genres,
    required this.onAnimeDetailsClicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        onTap: () {
          onAnimeDetailsClicked.call(id);
        },
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Stack(children: [
                Image.network(
                  imageUrl,
                  width: 300,
                  height: 450,
                  fit: BoxFit.fill,
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
