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
          CustomAppBar(title: 'Gain Solutions',showNotification: true),
          Expanded(
            child: Obx(() {
              if (viewModel.model.tickets.isEmpty) {
                return const Center(child: CircularProgressIndicator()); // Show loading until tickets are fetched
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_num), label: "Tickets"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts_outlined), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: 'Profile'),
        ],
        onTap: (tappedIndex){

        },
        currentIndex: 0,
      ),
    );
  }

  Widget _ticketCard(TicketEntity ticketEntity){
    return CustomContainer(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
      borderRadius: 8,
      backGroundColor: CustomColors().colorF9FAFB,
      alignment: Alignment.centerLeft,
      borderColor: CustomColors().color797979.withOpacity(0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ticketCardStatusUi(ticketEntity),
          10.ph,
          CustomText(
            text: '#ID ${ticketEntity.id}',
            color: CustomColors().colorB7B7B7,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          10.ph,
          CustomText(
            text: ticketEntity.title,
            color: CustomColors().color3B3B3B,
            fontSize: 14,
            maxLines: 2,
            fontWeight: FontWeight.w600,
          ),
          10.ph,
          _ticketCardUserTimeStampUi(ticketEntity),
          5.ph,
          const Divider(),
          5.ph,
          _ticketCardTagsUi(ticketEntity),
        ],
      ),
    );
  }

  Widget _ticketCardStatusUi(TicketEntity ticketEntity) {
    return CustomContainer(
      borderRadius: 8,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      backGroundColor :viewModel.getColorForStatus(ticketEntity.statusId).withOpacity(0.12),
      child: CustomText(
        text: ticketEntity.status,
        color: viewModel.getColorForStatus(ticketEntity.statusId),
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _ticketCardUserTimeStampUi(TicketEntity ticketEntity) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: ticketEntity.user,
          color: CustomColors().colorB7B7B7,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        CustomContainer(
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          backGroundColor: CustomColors().colorB7B7B7,
          height: 5,
          width: 5,
          borderRadius: 5,
        ),
        CustomText(
          text: ticketEntity.timestamp,
          color: CustomColors().colorB7B7B7,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _ticketCardTagsUi(TicketEntity ticketEntity) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ticketEntity.tags.length,
        itemBuilder: (ctx, index){
          return CustomContainer(
            borderRadius: 10,
            backGroundColor: CustomColors().white,
            borderColor: CustomColors().colorB7B7B7.withOpacity(0.5),
            borderWidth: 1,
            alignment: Alignment.center,
            margin: const EdgeInsets.only( right: 5),
            padding: const EdgeInsets.symmetric( horizontal: 8),
            child: CustomText(text: ticketEntity.tags[index], color: CustomColors().color797979, fontSize: 12, fontWeight: FontWeight.w500),
          );
        },
      ),
    );
  }

}
