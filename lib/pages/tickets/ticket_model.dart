import 'package:get/get.dart';
import './index.dart';

class TicketModel{
  RxList<TicketEntity> tickets = <TicketEntity>[].obs;

  RxList<String> brandListFromApi = <String>['Gains','GainsSolution','GainHQ','ITDesk','LTDHQ','Other'].obs;
  RxList<String> priorityListFromApi = <String>['Select Priority','Blocker','Urgent','High','Medium','Low'].obs;
  RxList<String> tagsListFromApi = <String>['Tag One','Tag two','Tag three long long text text','Tag four','Tag Five Simple','Tag Six long long text text','More and More tags','Tag Last'].obs;

}