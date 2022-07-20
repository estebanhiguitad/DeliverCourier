import 'package:domain/entities/order.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:infrastructure/hive/order_hive_box.dart';

class OrderRepositoryHive implements OrderRepository {
  OrderRepositoryHive(this._orderHiveBox);

  final OrderHiveBox _orderHiveBox;

  @override
  Future<Order> getAnOrder(int id) async {
    return _orderHiveBox.getById(id);
  }

  @override
  Future<List<Order>> getOrderList() async {
    return _orderHiveBox.get();
  }

  @override
  Future save(Order order) async {
    _orderHiveBox.add(order);
  }

  @override
  Future updateOrder(Order order) async {
    _orderHiveBox.update(order);
  }
}
