import 'package:get/get.dart';
import '../../index.dart';


class TicketsScreen extends StatelessWidget {
  TicketsScreen({super.key});

  final TicketsViewModel viewModel = Get.put(TicketsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(

      ),
    );
  }

  Widget _ticketCard(){
    return CustomContainer(
      padding: const EdgeInsets.all(10),
      borderRadius: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomContainer(
            borderRadius: 10,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: CustomText(text: 'Data'),
          ),
          10.ph,
          CustomText(text: 'TaskName'),
          10.ph,
          CustomText(text: 'datetime'),
          5.ph,
          const Divider(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomContainer(
                borderRadius: 10,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: CustomText(text: 'Data'),
              ),
              10.pw,
              CustomContainer(
                borderRadius: 10,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: CustomText(text: 'Data'),
              ),
            ],
          )
        ],
      ),
    );
  }


}
