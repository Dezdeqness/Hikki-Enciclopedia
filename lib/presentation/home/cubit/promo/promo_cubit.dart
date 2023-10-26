import 'package:bloc/bloc.dart';
import 'package:hikki_enciclopedia/data/datasource/promo/promo_api_datasource.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/promo/promo_state.dart';

class PromoCubit extends Cubit<PromoState> {
  final PromoApiDataSource dataSource;

  PromoCubit({required this.dataSource}) : super(PromoState());

  void fetchPromo() async {
    emit(state.copyWith(isLoading: true));
    final result = await dataSource.getPromoList();
    if (result.isSuccess) {
      emit(
        state.copyWith(items: result.success, isLoading: false),
      );
    } else {
      emit(state.copyWith(isLoading: false, isError: true));
    }
  }
}
