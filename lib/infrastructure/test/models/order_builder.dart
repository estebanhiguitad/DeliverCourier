import 'package:domain/entities/customer.dart';
import 'package:domain/entities/delivery_courier.dart';
import 'package:domain/entities/order.dart';
import 'package:domain/value_object/order_state.dart';

class OrderBuilder {
  int id = 0;
  OrderState state = OrderState.received;
  String description = "Description";
  int price = 1000;
  String startAddress = "Start address";
  String endAddress = "End address";
  DeliveryCourier deliveryCourier =
      const DeliveryCourier(0, 'This is a delivery courier');
  Customer customer = const Customer(0, 'This is a delivery courier');

  OrderBuilder withState(OrderState state) {
    this.state = state;
    return this;
  }

  withId(int id) {
    this.id = id;
    return this;
  }

  withDescription(String description) {
    this.description = description;
    return this;
  }

  withDeliveryCourier(DeliveryCourier deliveryCourier) {
    this.deliveryCourier = deliveryCourier;
    return this;
  }

  withCustomer(Customer customer) {
    this.customer = customer;
    return this;
  }

  Order build() =>
      Order(id, state, description, price, startAddress, endAddress,
          customer: customer, deliveryCourier: deliveryCourier);
}
