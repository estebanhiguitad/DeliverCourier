import '../entities/order.dart';
import '../repositories/order_repository.dart';

class SaveNewOrderService {
  OrderRepository repository;

  SaveNewOrderService(this.repository);

  void save(Order order) {
    repository.save(order);
  }
}
