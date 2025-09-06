// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'hikki_app_router.dart';

/// generated route for
/// [AuthorizePage]
class AuthorizeRoute extends PageRouteInfo<void> {
  const AuthorizeRoute({List<PageRouteInfo>? children})
      : super(AuthorizeRoute.name, initialChildren: children);

  static const String name = 'AuthorizeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthorizePage();
    },
  );
}

/// generated route for
/// [EntryPage]
class EntryRoute extends PageRouteInfo<void> {
  const EntryRoute({List<PageRouteInfo>? children})
      : super(EntryRoute.name, initialChildren: children);

  static const String name = 'EntryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EntryPage();
    },
  );
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
/// [MovieDetailsPage]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return MovieDetailsPage(key: args.key, id: args.id);
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [PersonalPage]
class PersonalRoute extends PageRouteInfo<void> {
  const PersonalRoute({List<PageRouteInfo>? children})
      : super(PersonalRoute.name, initialChildren: children);

  static const String name = 'PersonalRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PersonalPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [TvDetailsPage]
class TvDetailsRoute extends PageRouteInfo<TvDetailsRouteArgs> {
  TvDetailsRoute({Key? key, required String id, List<PageRouteInfo>? children})
      : super(
          TvDetailsRoute.name,
          args: TvDetailsRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'TvDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TvDetailsRouteArgs>();
      return TvDetailsPage(key: args.key, id: args.id);
    },
  );
}

class TvDetailsRouteArgs {
  const TvDetailsRouteArgs({this.key, required this.id});

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'TvDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TvDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}
