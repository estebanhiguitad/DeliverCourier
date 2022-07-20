import 'package:domain/domain.dart';
import 'package:infrastructure/hive/order_hive_entity.dart';

class OrderHiveMapper {
  toOrder(OrderHiveEntity orderHiveEntity) {
    return Order(
      1,
      OrderState.values[orderHiveEntity.state],
      orderHiveEntity.description,
      orderHiveEntity.price,
      orderHiveEntity.startAddress,
      orderHiveEntity.endAddress,
    );
  }
}
