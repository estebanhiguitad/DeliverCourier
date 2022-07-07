import 'package:domain/repositories/order_repository.dart';

import '../entities/order.dart';

class SaveNewOrderService {
  OrderRepository repository;

  SaveNewOrderService(this.repository);

  void save(Order order) {
    repository.save(order);
  }
}
