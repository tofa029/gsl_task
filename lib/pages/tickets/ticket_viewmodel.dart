import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../index.dart';

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

  Color getColorForStatus(int statusId){

    ///1: 'New',
    ///2: 'First response overdue',
    ///3: 'In Progress',
    ///4: 'Resolved',
    ///5: 'Closed',
    ///6: 'Escalated',
    ///7: 'Pending',

    //this method is for choosing color for specific status
    switch (statusId) {
      case 1:
        return CustomColors().color44A9F1;
      case 2:
        return CustomColors().colorFFAB00;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.green;
      case 5:
        return Colors.black;
      case 6:
        return CustomColors().color5A49B4;
      case 7:
        return Colors.deepOrangeAccent;
      default:
        return CustomColors().black;
    }
  }
}