import '../entities/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrderList();

  Future updateOrder(Order order);

  Future<Order> getAnOrder(String id);

  Future save(Order order);
}
