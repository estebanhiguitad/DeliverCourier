import 'package:domain/value_object/order_state.dart';
import 'package:infrastructure/objectbox/customer_entity.dart';
import 'package:infrastructure/objectbox/delivery_couriers_entity.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class OrderEntity {
  @Id(assignable: true)
  int id = 0;
  String startAddress;
  String endAddress;
  int price;
  String description;

  OrderState status = OrderState.received;

  int? get dbStatus {
    return status.index;
  }

  set dbStatus(int? value) {
    if (value == null) {
      status = OrderState.received;
      return;
    }

    status = value >= 0 && value < OrderState.values.length
        ? OrderState.values[value]
        : OrderState.received;
  }

  final customer = ToOne<CustomerEntity>();
  final deliveryCourier = ToOne<DeliveryCourierEntity>();

  OrderEntity(this.startAddress, this.endAddress, this.description, this.price,
      {this.status = OrderState.received});
}
