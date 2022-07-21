import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:infrastructure/data_source/local/contants_hive.dart';
import 'package:infrastructure/data_source/local/order_hive_entity.dart';
import 'package:infrastructure/data_source/local/order_hive_mapper.dart';
import 'package:infrastructure/data_source/local/order_local_data_source.dart';

class OrderHiveBox implements OrderLocalDataSource {
  OrderHiveBox(this._orderHiveMapper) {
    _orderHiveEntityBox = Hive.box<OrderHiveEntity>(orderBoxName);
  }

  late Box<OrderHiveEntity> _orderHiveEntityBox;
  final OrderHiveMapper _orderHiveMapper;

  @override
  Future<void> insert(Order order) async {
    final orderHiveEntity = _orderHiveMapper.toOrderHiveEntity(order);
    await _orderHiveEntityBox.put(orderHiveEntity.uid, orderHiveEntity);
  }

  @override
  List<Order> get() {
    final orders = _orderHiveEntityBox.values
        .map((it) => _orderHiveMapper.toOrder(it))
        .toList();
    return orders;
  }

  @override
  Order getByUid(String uid) {
    final orderHiveEntity = _getOrderHiveEntity(uid);
    final order = _orderHiveMapper.toOrder(orderHiveEntity);
    return order;
  }

  @override
  Future<void> update(Order order) async {
    final orderHiveEntity = _getOrderHiveEntity(order.uid);
    _orderHiveMapper.mapper(order, orderHiveEntity);
    await orderHiveEntity.save();
  }

  @override
  Future<void> delete(Order order) async {
    final orderHiveEntity = _getOrderHiveEntity(order.uid);
    await orderHiveEntity.delete();
  }

  OrderHiveEntity _getOrderHiveEntity(String uid) {
    final orderHiveEntity = _orderHiveEntityBox.get(uid);
    if (orderHiveEntity == null) {
      throw Exception();
    }
    return orderHiveEntity;
  }
}
