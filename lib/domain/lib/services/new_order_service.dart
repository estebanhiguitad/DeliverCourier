import 'package:domain/models/order.dart';
import 'package:domain/repositories/order_repository.dart';

class NewOrderService {
  OrderRepository repository;

  NewOrderService(this.repository);

  void save(Order order) {
    repository.save(order);
  }
}
