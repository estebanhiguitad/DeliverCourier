
import '../models/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrderList();

  void updateOrder(Order order);

  Future<Order> getAnOrder(int id);

  void save(Order order);
}
