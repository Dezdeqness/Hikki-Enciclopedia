import 'package:hikki_enciclopedia/core/extensions/response_extension.dart';
import 'package:hikki_enciclopedia/data/datasource/promo_api_datasource.dart';
import 'package:hikki_enciclopedia/data/mapper/promo_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/promotional_entitiy.dart';
import 'package:result_type/result_type.dart';

import '../../domain/model/error_entity.dart';
import '../core/base_api_datasource.dart';
import '../mapper/error_mapper.dart';
import '../service/promo_service.dart';

class PromoApiDatasourceImpl extends BaseApiDatasource
    implements PromoApiDataSource {
  final PromoService _promoService;
  final PromoMapper _promoMapper;

  PromoApiDatasourceImpl(
    this._promoService,
    this._promoMapper,
    ErrorMapper errorMapper,
  ) : super(errorMapper);

  @override
  Future<Result<List<PromotionalEntity>, ErrorEntity>> getPromoList() async {
    try {
      final response = await _promoService.getPromoDoc();
      if (response.isSuccessRequest()) {
        return Success(_promoMapper.map(response.data.toString()));
      } else {
        return Failure(ErrorEntity.unknown);
      }
    } on Exception catch (e) {
      return Failure(errorMapper.mapException(e));
    }
  }
}
