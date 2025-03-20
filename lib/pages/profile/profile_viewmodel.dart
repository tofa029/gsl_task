import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../index.dart';

class ProfileViewModel extends GetxController {
  ProfileModel model = ProfileModel();

  @override
  void onInit() {
    super.onInit();
    gettingApiForProfile();
  }

  ///this method is for getting profile from api simulates an api response by json object
  ///which is stored in json file to asset folder
  ///and converted to [ContactEntity] to show profile and saved as a list which is observable
  Future<void> gettingApiForProfile()async{
    await Future.delayed(const Duration(seconds: 2));

    try{
      final String response = await rootBundle.loadString('assets/json_data/contacts.json');
      final List<dynamic> data = jsonDecode(response);
      model.profile.value = data.map((json) => ContactEntity.fromJson(json)).toList().first;
    }catch(e, stacktrace){
      debugPrintStack(stackTrace: stacktrace);
    }
  }

}