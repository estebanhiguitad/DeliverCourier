import 'order_state.dart';

class Order{
  int id;
  OrderState state;
  String description;
  int price;
  String startAddress;
  String endAddress;

  Order(this.id, this.state, this.description, this.price, this.startAddress, this.endAddress);
}