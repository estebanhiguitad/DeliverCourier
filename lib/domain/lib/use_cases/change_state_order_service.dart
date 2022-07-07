import '../entities/order.dart';
import '../repositories/order_repository.dart';

class ChangeStateOrderService {
  final OrderRepository _orderRepository;

  ChangeStateOrderService(this._orderRepository);

  void updateOrderState(Order order) {
    order.changeStateToNext();
    _orderRepository.updateOrder(order);
  }
}
