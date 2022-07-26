import 'package:domain/domain.dart';
import 'package:infrastructure/data_source/local/order_hive_entity.dart';

extension OrderMapper on Order {
  OrderHiveEntity toOrderHiveEntity() {
    return OrderHiveEntity(
      uid,
      startAddress,
      endAddress,
      description,
      price,
      state.index,
      createdAt,
    );
  }
}
