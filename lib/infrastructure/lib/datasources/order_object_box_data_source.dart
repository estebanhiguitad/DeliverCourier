import 'package:infrastructure/objectbox/order_entity.dart';

abstract class OrderObjectBoxDataSource {
  List<OrderEntity> getAll();

  OrderEntity getAnOrder(int id);

  void saveOrUpdate(OrderEntity orderEntity);
}
