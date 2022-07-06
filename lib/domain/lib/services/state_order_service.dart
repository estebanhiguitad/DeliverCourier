import 'package:domain/models/order.dart';

import '../repositories/order_repository.dart';

class StateOrderService {
  final OrderRepository _orderRepository;

  StateOrderService(this._orderRepository);

  void updateOrderState(Order order) {
    order.changeStateToNext();
    _orderRepository.updateOrder(order);
  }
}
