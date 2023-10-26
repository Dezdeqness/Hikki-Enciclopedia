// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'hikki_app_router.dart';

abstract class _$HikkiAppRouter extends RootStackRouter {
  // ignore: unused_element
  _$HikkiAppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AnimeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnimeDetailsPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
    ExplorerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExplorerPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    PersonalListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonalListPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
  };
}

/// generated route for
/// [AnimeDetailsPage]
class AnimeDetailsRoute extends PageRouteInfo<AnimeDetailsRouteArgs> {
  AnimeDetailsRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AnimeDetailsRoute.name,
          args: AnimeDetailsRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AnimeDetailsRoute';

  static const PageInfo<AnimeDetailsRouteArgs> page =
      PageInfo<AnimeDetailsRouteArgs>(name);
}

class AnimeDetailsRouteArgs {
  const AnimeDetailsRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'AnimeDetailsRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [ExplorerPage]
class ExplorerRoute extends PageRouteInfo<void> {
  const ExplorerRoute({List<PageRouteInfo>? children})
      : super(
          ExplorerRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExplorerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonalListPage]
class PersonalListRoute extends PageRouteInfo<void> {
  const PersonalListRoute({List<PageRouteInfo>? children})
      : super(
          PersonalListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
