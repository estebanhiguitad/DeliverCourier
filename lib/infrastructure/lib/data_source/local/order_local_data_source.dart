import 'package:domain/domain.dart';

abstract class OrderLocalDataSource {
  Future<void> insert(Order order);

  List<Order> get();

  Order getByUid(String uid);

  Future<void> update(Order order);

  Future<void> delete(Order order);
}
