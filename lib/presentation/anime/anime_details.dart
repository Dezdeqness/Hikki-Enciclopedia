import 'package:flutter/material.dart';

class AnimeDetailsArguments {
  final String title;

  AnimeDetailsArguments({required this.title});
}

class AnimeDetails extends StatelessWidget {
  const AnimeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as AnimeDetailsArguments;
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(args.title),
      ),
    );
  }
}
