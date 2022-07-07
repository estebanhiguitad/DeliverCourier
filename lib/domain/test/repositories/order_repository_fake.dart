import 'package:domain/entities/order.dart';
import 'package:domain/repositories/order_repository.dart';

class OrderRepositoryFake implements OrderRepository {
  final List<Order> _list;

  OrderRepositoryFake(this._list);

  @override
  Future<List<Order>> getOrderList() async {
    return _list;
  }

  @override
  Future<Order> getAnOrder(int id) async {
    return _list.firstWhere((element) => element.id == id);
  }

  @override
  Future updateOrder(Order order) async {
    _list.removeWhere((element) => element.id == order.id);
    _list.add(order);
  }

  @override
  Future save(Order order) async {
    _list.add(order);
  }
}
