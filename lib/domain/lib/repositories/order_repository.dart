
import '../models/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrderList();

  Future updateOrder(Order order);

  Future<Order> getAnOrder(int id);

  Future save(Order order);
}
