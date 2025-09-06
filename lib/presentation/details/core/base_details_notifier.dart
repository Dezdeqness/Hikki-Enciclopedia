import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseDetailsNotifier<T extends Object>
    extends AutoDisposeFamilyAsyncNotifier<T, String> {
  Future<T> load(String id);

  @override
  Future<T> build(String arg) async {
    state = const AsyncLoading();
    try {
      final result = await load(arg);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}