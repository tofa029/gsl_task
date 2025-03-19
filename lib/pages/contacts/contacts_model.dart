import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../index.dart';

class ContactsModel{

  RxList<ContactEntity> contactList = <ContactEntity>[].obs;
  RxList<String> itemList = <String>['Edit','View Tickets','delete'].obs;
  Rx<int?> activeCardIndex = Rx<int?>(null);
}