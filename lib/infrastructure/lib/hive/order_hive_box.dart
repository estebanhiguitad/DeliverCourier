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
    _orderHiveEntityBox.add(orderHiveEntity);
  }

  List<Order> get() {
    final orders = _orderHiveEntityBox.values
        .map((it) => _orderHiveMapper.toOrder(it))
        .toList();
    return orders;
  }

  Order getById(int id) {
    final orderHiveEntity = _orderHiveEntityBox.getAt(id);
    if (orderHiveEntity == null) {
      throw Exception();
    }
    final order = _orderHiveMapper.toOrder(orderHiveEntity);
    return order;
  }

  update(Order order) {
    final orderHiveEntity = _getAt(order.id);
    orderHiveEntity.startAddress = order.startAddress;
    orderHiveEntity.save();
  }

  delete(Order order) {
    final orderHiveEntity = _getAt(order.id);
    orderHiveEntity.delete();
  }

  OrderHiveEntity _getAt(int id) {
    final orderHiveEntity = _orderHiveEntityBox.getAt(id);
    if (orderHiveEntity == null) {
      throw Exception();
    }
    return orderHiveEntity;
  }
}
