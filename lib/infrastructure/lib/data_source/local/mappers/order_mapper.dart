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
    );
  }

  replaceOrderHiveEntity(OrderHiveEntity orderHiveEntity) {
    orderHiveEntity.startAddress = startAddress;
    orderHiveEntity.endAddress = endAddress;
    orderHiveEntity.description = description;
    orderHiveEntity.price = price;
    orderHiveEntity.state = state.index;
    return orderHiveEntity;
  }
}
