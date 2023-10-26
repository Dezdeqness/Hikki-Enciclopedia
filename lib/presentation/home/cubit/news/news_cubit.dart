import 'package:bloc/bloc.dart';
import 'package:hikki_enciclopedia/data/datasource/news/news_api_datasource.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/news/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsApiDataSource dataSource;

  NewsCubit({required this.dataSource}) : super(NewsState());

  void fetchNews() async {
    emit(state.copyWith(isLoading: true));
    final result = await dataSource.getNewsList();
    if (result.isSuccess) {
      emit(
        state.copyWith(items: result.success, isLoading: false),
      );
    } else {
      emit(state.copyWith(isLoading: false, isError: true));
    }
  }
}
