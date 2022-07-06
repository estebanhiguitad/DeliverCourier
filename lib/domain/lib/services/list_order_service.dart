import '../models/order.dart';
import '../repositories/order_repository.dart';

class ListOrderService{
  OrderRepository repository;

  ListOrderService(this.repository);

  Future<List<Order>> getOrderList() {
    return repository.getOrderList();
  }
}
