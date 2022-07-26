import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:infrastructure/data_source/local/order_hive_entity.dart';
import 'package:infrastructure/data_source/local/order_local_data_source.dart';
import 'package:infrastructure/data_source/local/mappers/order_mapper.dart';
import 'package:infrastructure/data_source/local/mappers/order_hive_entity_mapper.dart';

class OrderHiveBox implements OrderLocalDataSource {
  OrderHiveBox(HiveInterface hiveDataBase, String boxName) {
    _orderBox = hiveDataBase.box<OrderHiveEntity>(boxName);
  }

  late Box<OrderHiveEntity> _orderBox;

  @override
  Future<void> insert(Order order) async {
    final orderHiveEntity = order.toOrderHiveEntity();
    _orderBox.put(orderHiveEntity.uid, orderHiveEntity);
  }

  @override
  List<Order> get() {
    final orders = _orderBox.values
        .map((orderHiveEntity) => orderHiveEntity.toOrder())
        .toList();

    return orders;
  }

  @override
  Order getByUid(String uid) {
    final orderHiveEntity = _getOrderHiveEntity(uid);
    return orderHiveEntity.toOrder();
  }

  @override
  Future<void> update(Order order) async {
    final orderHiveEntity = _getOrderHiveEntity(order.uid);
    orderHiveEntity.replace(order);
    await orderHiveEntity.save();
  }

  @override
  Future<void> delete(Order order) async {
    final orderHiveEntity = _getOrderHiveEntity(order.uid);
    await orderHiveEntity.delete();
  }

  OrderHiveEntity _getOrderHiveEntity(String uid) {
    final orderHiveEntity = _orderBox.get(uid);
    if (orderHiveEntity == null) {
      throw Exception();
    }
    return orderHiveEntity;
  }
}
