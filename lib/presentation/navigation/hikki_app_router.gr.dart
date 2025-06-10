// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'hikki_app_router.dart';

/// generated route for
/// [AnimeDetailsPage]
class AnimeDetailsRoute extends PageRouteInfo<AnimeDetailsRouteArgs> {
  AnimeDetailsRoute({required int id, Key? key, List<PageRouteInfo>? children})
      : super(
          AnimeDetailsRoute.name,
          args: AnimeDetailsRouteArgs(id: id, key: key),
          initialChildren: children,
        );

  static const String name = 'AnimeDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AnimeDetailsRouteArgs>();
      return AnimeDetailsPage(id: args.id, key: args.key);
    },
  );
}

class AnimeDetailsRouteArgs {
  const AnimeDetailsRouteArgs({required this.id, this.key});

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'AnimeDetailsRouteArgs{id: $id, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AnimeDetailsRouteArgs) return false;
    return id == other.id && key == other.key;
  }

  @override
  int get hashCode => id.hashCode ^ key.hashCode;
}

/// generated route for
/// [ExplorerPage]
class ExplorerRoute extends PageRouteInfo<void> {
  const ExplorerRoute({List<PageRouteInfo>? children})
      : super(ExplorerRoute.name, initialChildren: children);

  static const String name = 'ExplorerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExplorerPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [PersonalListPage]
class PersonalListRoute extends PageRouteInfo<void> {
  const PersonalListRoute({List<PageRouteInfo>? children})
      : super(PersonalListRoute.name, initialChildren: children);

  static const String name = 'PersonalListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PersonalListPage();
    },
  );
}
