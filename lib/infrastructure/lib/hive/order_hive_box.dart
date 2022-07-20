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

  add() {
    _orderHiveEntityBox.add(OrderHiveEntity());
  }

  get() {
    final orders = _orderHiveEntityBox.values;
  }

  OrderHiveEntity getById(int id) {
    final orderHiveEntity = _orderHiveEntityBox.getAt(id);
    if (orderHiveEntity == null) {
      throw Exception();
    }
    return orderHiveEntity;
  }

  update(Order order) {
    final orderHiveEntity = getById(order.id);
    orderHiveEntity.startAddress = order.startAddress;
    orderHiveEntity.save();
  }

  delete(Order order) {
    final orderHiveEntity = getById(order.id);
    orderHiveEntity.delete();
  }
}
