import '../entities/order.dart';
import '../exceptions/no_data_exception.dart';
import '../repositories/order_repository.dart';

class GetListOrder {
  GetListOrder(this._orderRepository);

  final OrderRepository _orderRepository;

  Future<List<Order>> call() async {
    final result = await _orderRepository.getOrderList();
    if (result.isEmpty) {
      throw NoDataException();
    }
    return result;
  }
}
