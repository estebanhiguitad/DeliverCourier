import 'package:domain/domain.dart';
import 'package:infrastructure/hive/order_hive_entity.dart';

class OrderHiveMapper {
  Order toOrder(OrderHiveEntity orderHiveEntity) {
    return Order(
      orderHiveEntity.uid,
      1,
      OrderState.values[orderHiveEntity.state],
      orderHiveEntity.description,
      orderHiveEntity.price,
      orderHiveEntity.startAddress,
      orderHiveEntity.endAddress,
    );
  }

  OrderHiveEntity toOrderHiveEntity(Order order) {
    return OrderHiveEntity(
      order.uid,
      order.startAddress,
      order.endAddress,
      order.description,
      order.price,
      order.state.index,
    );
  }

  OrderHiveEntity mapper(Order order, OrderHiveEntity orderHiveEntity) {
    orderHiveEntity.startAddress = order.startAddress;
    orderHiveEntity.endAddress = order.endAddress;
    orderHiveEntity.description = order.description;
    orderHiveEntity.price = order.price;
    orderHiveEntity.state = order.state.index;
    return orderHiveEntity;
  }
}
