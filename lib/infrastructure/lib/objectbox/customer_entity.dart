import 'package:infrastructure/objectbox/order_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CustomerEntity {
  int id = 0;
  String name;
  final order = ToMany<OrderEntity>();

  CustomerEntity(this.name);
}
