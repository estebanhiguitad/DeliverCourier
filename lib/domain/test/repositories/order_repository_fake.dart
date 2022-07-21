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
  Future<Order> getAnOrder(String id) async {
    return _list.firstWhere((element) => element.uid == id);
  }

  @override
  Future updateOrder(Order order) async {
    _list.removeWhere((element) => element.uid == order.uid);
    _list.add(order);
  }

  @override
  Future save(Order order) async {
    _list.add(order);
  }
}
