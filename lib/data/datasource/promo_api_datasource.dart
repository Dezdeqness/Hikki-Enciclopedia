import 'package:hikki_enciclopedia/domain/model/promotional_entitiy.dart';
import 'package:result_type/result_type.dart';

import '../../domain/model/error_entity.dart';

abstract class PromoApiDataSource {
  Future<Result<List<PromotionalEntity>, ErrorEntity>> getPromoList();
}
