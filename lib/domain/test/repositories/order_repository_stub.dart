
import 'package:domain/models/order.dart';
import 'package:domain/repositories/order_repository.dart';

import '../models/order_builder.dart';

class OrderRepositoryStub implements OrderRepository {
  @override
  Future<List<Order>> getOrderList() async {
    return [
      OrderBuilder().build(),
      OrderBuilder().withId(1).build(),
    ];
  }

  @override
  Future<Order> getAnOrder(int id) {
    // not implement getAnOrder
    throw UnimplementedError();
  }

  @override
  void save(Order order) {
    // not implement save
  }

  @override
  void updateOrder(Order order) {
    // not implement updateOrder
  }
}