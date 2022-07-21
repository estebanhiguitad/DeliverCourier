import 'package:domain/entities/order.dart';

abstract class OrderObjectBoxDataSource {
  List<Order> getAll();

  Order getAnOrder(int id);

  Future saveOrUpdate(Order orderEntity);
}
