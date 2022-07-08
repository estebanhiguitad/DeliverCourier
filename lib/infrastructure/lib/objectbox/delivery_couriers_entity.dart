import 'package:objectbox/objectbox.dart';

@Entity()
class DeliveryCourierEntity {
  int id = 0;
  String name;

  DeliveryCourierEntity(this.name);
}
