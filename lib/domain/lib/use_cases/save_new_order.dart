import 'package:domain/repositories/order_repository.dart';

import '../entities/order.dart';

class SaveNewOrder {
  OrderRepository repository;

  SaveNewOrder(this.repository);

  void save(Order order) {
    repository.save(order);
  }
}
