import 'package:domain/domain.dart';
import 'package:infrastructure/data_source/local/order_hive_entity.dart';

extension OrderHiveEntityMapper on OrderHiveEntity {
  Order toOrder() {
    return Order(
      uid,
      OrderState.values[state],
      description,
      price,
      startAddress,
      endAddress,
    );
  }
}
