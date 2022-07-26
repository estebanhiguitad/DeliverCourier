import 'package:domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:infrastructure/data_source/local/order_hive_entity.dart';
import 'package:infrastructure/data_source/local/order_local_data_source.dart';
import 'package:infrastructure/data_source/local/mappers/order_mapper.dart';
import 'package:infrastructure/data_source/local/mappers/order_hive_entity_mapper.dart';

class OrderHiveBox implements OrderLocalDataSource {
  OrderHiveBox() {}

  @override
  Future<void> insert(Order order) async {
    throw Exception();
  }

  @override
  List<Order> get() {
    throw Exception();
  }

  @override
  Order getByUid(String uid) {
    throw Exception();
  }

  @override
  Future<void> update(Order order) async {
    throw Exception();
  }

  @override
  Future<void> delete(Order order) async {
    throw Exception();
  }

  OrderHiveEntity _getOrderHiveEntity(String uid) {
    final orderHiveEntity = _orderBox.get(uid);
    if (orderHiveEntity == null) {
      throw Exception();
    }
    return orderHiveEntity;
  }
}
