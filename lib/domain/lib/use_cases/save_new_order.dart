import 'package:domain/repositories/order_repository.dart';

import '../entities/order.dart';

class SaveNewOrder {
  SaveNewOrder(this._orderRepository);

  final OrderRepository _orderRepository;

  void call(Order order) {
    _orderRepository.save(order);
  }
}
