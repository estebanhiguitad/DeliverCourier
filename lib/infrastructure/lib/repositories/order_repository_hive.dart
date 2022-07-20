import 'package:domain/entities/order.dart';
import 'package:domain/repositories/order_repository.dart';
import 'package:infrastructure/hive/order_hive_box.dart';

class OrderRepositoryHive implements OrderRepository {
  OrderRepositoryHive(this._orderHiveBox);

  final OrderHiveBox _orderHiveBox;

  @override
  Future<Order> getAnOrder(int id) {
    // TODO: implement getAnOrder
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getOrderList() {
    // TODO: implement getOrderList
    throw UnimplementedError();
  }

  @override
  Future save(Order order) async {
    _orderHiveBox.add();
  }

  @override
  Future updateOrder(Order order) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }
}
