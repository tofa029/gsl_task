import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../index.dart';

class ContactsViewModel extends GetxController {
  ContactsModel model = ContactsModel();

  @override
  void onInit() {
    super.onInit();
    gettingApiForContacts();
  }

  ///this method is for getting contact list from api simulates an api response by json object
  ///which is stored in json file to asset folder
  ///and converted to [ContactEntity] and saved as a list which is observable
  Future<void> gettingApiForContacts()async{
    await Future.delayed(const Duration(seconds: 2));

    try{
      final String response = await rootBundle.loadString('assets/json_data/contacts.json');
      final List<dynamic> data = jsonDecode(response);
      model.contactList.value = data.map((json) => ContactEntity.fromJson(json)).toList();
      model.contactFilteredList.value = model.contactList;
    }catch(e, stacktrace){
      debugPrintStack(stackTrace: stacktrace);
    }
  }

  ///this method is for search contacts by number or name and update observable list
  void searchContacts(String value){
    if(value.isNotEmpty){
      model.contactFilteredList.value = model.contactList.where((contact){
        return ((contact.phone ?? '').contains(value) || (contact.name ?? '').toLowerCase().contains(value));
      }).toList();
    }else{
      model.contactFilteredList.value = model.contactList;
    }
  }

}