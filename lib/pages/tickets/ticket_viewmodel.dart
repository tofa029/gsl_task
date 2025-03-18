import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'index.dart';

class TicketsViewModel extends GetxController {
  TicketModel model = TicketModel();

  @override
  void onInit() {
    super.onInit();
    gettingApiForTickets();
  }

  Future<void> gettingApiForTickets()async{
    await Future.delayed(const Duration(seconds: 2));

    try{
      final String response = await rootBundle.loadString('assets/json_data/tickets.json');
      final List<dynamic> data = jsonDecode(response);
      model.tickets.value = data.map((json) => TicketEntity.fromJson(json)).toList();
    }catch(e, stacktrace){
      debugPrintStack(stackTrace: stacktrace);
    }
  }
}