import 'package:infrastructure/objectbox/order_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DeliveryCouriers {
  int id = 0;
  String name;
  final orders = ToMany<OrderEntity>();

  DeliveryCouriers(this.name);
}
