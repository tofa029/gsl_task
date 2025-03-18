import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../index.dart';


class TicketsScreen extends StatelessWidget {
  TicketsScreen({super.key});

  final TicketsViewModel viewModel = Get.put(TicketsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          30.ph,
          Expanded(
            child: Obx(() {
              if (viewModel.model.tickets.isEmpty) {
                return const Center(child: CircularProgressIndicator()); // Show loading until tickets are fetched
              }
              return ListView.builder(
                itemCount: viewModel.model.tickets.length,
                itemBuilder: (context, index) {
                  final ticket = viewModel.model.tickets[index];
                  return _ticketCard(ticket);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _ticketCard(TicketEntity ticketEntity){
    return CustomContainer(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      backGroundColor: CustomColors().colorF9FAFB,
      alignment: Alignment.centerLeft,
      borderColor: CustomColors().color797979.withOpacity(0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            borderRadius: 8,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            backGroundColor:CustomColors().color44A9F1.withOpacity(0.12),
            child: CustomText(
                text: ticketEntity.status,
              color: CustomColors().color44A9F1,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
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
