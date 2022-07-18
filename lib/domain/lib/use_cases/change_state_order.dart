import '../entities/order.dart';
import '../repositories/order_repository.dart';

class ChangeStateOrder {
  final OrderRepository _orderRepository;

  ChangeStateOrder(this._orderRepository);

  void updateOrderState(Order order) {
    order.changeStateToNext();
    _orderRepository.updateOrder(order);
  }
}
