import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:infrastructure/hive/contants_hive.dart';
import 'package:infrastructure/hive/order_hive_entity.dart';
import 'package:infrastructure/hive/order_hive_mapper.dart';

class OrderHiveBox {
  OrderHiveBox(this._orderHiveMapper) {
    _orderHiveEntityBox = Hive.box<OrderHiveEntity>(orderBox);
  }

  late Box<OrderHiveEntity> _orderHiveEntityBox;
  final OrderHiveMapper _orderHiveMapper;

  add(Order order) {
    final orderHiveEntity = _orderHiveMapper.toOrderHiveEntity(order);
    _orderHiveEntityBox.put(orderHiveEntity.uid, orderHiveEntity);
  }

  List<Order> get() {
    final orders = _orderHiveEntityBox.values
        .map((it) => _orderHiveMapper.toOrder(it))
        .toList();
    return orders;
  }

  Order getByUid(String uid) {
    final orderHiveEntity = _getOrderHiveEntity(uid);
    final order = _orderHiveMapper.toOrder(orderHiveEntity);
    return order;
  }

  update(Order order) {
    final orderHiveEntity = _getOrderHiveEntity(order.uid);
    orderHiveEntity.startAddress = order.startAddress;
    orderHiveEntity.save();
  }

  delete(Order order) {
    final orderHiveEntity = _getOrderHiveEntity(order.uid);
    orderHiveEntity.delete();
  }

  OrderHiveEntity _getOrderHiveEntity(String uid) {
    final orderHiveEntity = _orderHiveEntityBox.get(uid);
    if (orderHiveEntity == null) {
      throw Exception();
    }
    return orderHiveEntity;
  }
}
