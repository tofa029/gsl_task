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