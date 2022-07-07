import 'package:infrastructure/objectbox/order_entity.dart';
import 'package:objectbox/objectbox.dart';

import 'order_object_box_data_source.dart';

class OrderObjectBoxDataSourceImpl implements OrderObjectBoxDataSource {
  final Store store;

  OrderObjectBoxDataSourceImpl(this.store);

  @override
  List<OrderEntity> getAll() => store.box<OrderEntity>().getAll();

  @override
  OrderEntity getAnOrder(int id) => store.box<OrderEntity>().get(id)!;

  @override
  void saveOrUpdate(OrderEntity orderEntity) {
    store.box<OrderEntity>().put(orderEntity);
  }
}
