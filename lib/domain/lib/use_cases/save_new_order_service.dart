import 'package:domain/models/order.dart';
import 'package:domain/repositories/order_repository.dart';

class SaveNewOrderService {
  OrderRepository repository;

  SaveNewOrderService(this.repository);

  void save(Order order) {
    repository.save(order);
  }
}
