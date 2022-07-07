import '../entities/order.dart';
import '../exceptions/no_data_exception.dart';
import '../repositories/order_repository.dart';

class GetListOrderService {
  OrderRepository repository;

  GetListOrderService(this.repository);

  Future<List<Order>> getOrderList() async {
    final result = await repository.getOrderList();
    if (result.isEmpty) {
      throw NoDataException();
    }
    return result;
  }
}
