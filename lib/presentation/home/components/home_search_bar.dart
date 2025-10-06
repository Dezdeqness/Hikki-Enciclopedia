import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w1920_and_h600_multi_faces_filter(duotone,00192f,00baff)/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: GestureDetector(
              onTap: () {
                context.pushRoute(ExplorerRoute());
              },
              child: Hero(
                tag: 'searchBarHero',
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        const Icon(Icons.search, color: Colors.blueAccent),
                        const SizedBox(width: 8),
                        Text(
                          'Search...',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
