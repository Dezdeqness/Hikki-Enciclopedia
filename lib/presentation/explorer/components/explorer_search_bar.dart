import 'package:flutter/material.dart';

class ExplorerSearchBar extends StatelessWidget {
  const ExplorerSearchBar({
    super.key,
    required this.searchController,
    required this.onChanged,
  });

  final void Function(String) onChanged;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Hero(
        tag: 'searchBarHero',
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: searchController,
                  autofocus: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search movies, series, people...',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 17,
                      height: 1.2,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    height: 1.2,
                  ),
                  onChanged: onChanged,
                ),
              ),
              if (searchController.text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4),
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 24,
                      maxWidth: 24,
                    ),
                    child: IconButton(
                      icon:
                          const Icon(Icons.clear, color: Colors.grey, size: 24),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        searchController.clear();
                        onChanged("");
                      },
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
