import 'package:result_type/result_type.dart';

extension ResultWhen<T, E extends Exception> on Result<T, E> {
  R when<R>({
    required R Function(T data) success,
    required R Function(E error) failure,
  }) {
    final result = this;
    if (result is Success<T, E>) {
      return success(result.value);
    } else if (result is Failure<T, E>) {
      return failure((result.failure));
    } else {
      throw Exception('Invalid Result type');
    }
  }
}
