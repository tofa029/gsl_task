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
          CustomAppBar(title: 'Gain Sloutions',showNotification: true),
          Expanded(
            child: Obx(() {
              if (viewModel.model.tickets.isEmpty) {
                return const Center(child: CircularProgressIndicator()); // Show loading until tickets are fetched
              }
              return Column(
                children: [
                  _ticketCountWithFilterUi(context),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: viewModel.model.tickets.length,
                      itemBuilder: (context, index) {
                        final ticket = viewModel.model.tickets[index];
                        return _ticketCard(ticket);
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(currentIndex: 0)
    );
  }

  ///this widget is responsible to build ticket count in ui
  ///take [TicketEntity] as positional param
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

  ///this widget is responsible to build ticket card status in ui
  ///take [TicketEntity] as positional param
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

  ///this widget is responsible to build ticket card timestamp in ui
  ///take [TicketEntity] as positional param
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

  ///this widget is responsible to build ticket card tags in ui
  ///take [TicketEntity] as positional param
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

  ///this widget is responsible to build tickets count in ui
  ///take [BuildContext] as positional param
  Widget _ticketCountWithFilterUi(BuildContext context){
    return Obx(() => Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: "${viewModel.model.tickets.length} tickets",
            color: CustomColors().colorB7B7B7,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          InkWell(
              onTap:(){
                _filterPopUp(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.filter_alt_outlined),
              )
          )
        ],
      ),
    ));
  }

  ///this widget is responsible to build ticket filter popup in ui
  ///take [BuildContext] as positional param
  Future<void> _filterPopUp(BuildContext context)async{
    showDialog(
        context: context,
        builder: (ctx){
          return Material(
            child: CustomContainer(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              backGroundColor: CustomColors().white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _filterPopHeader(ctx),
                    _brandNamesForFilter(),
                    _priorityFilterDropdown(),
                    _searchTagUi()
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  ///this widget is responsible to build filter header timestamp in filter ui
  ///take [BuildContext] as positional param
  Widget _filterPopHeader(BuildContext context){
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.cancel_outlined),
          ),
        ),
        CustomText(
          text: "Filters",
          color: CustomColors().color3B3B3B,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),
        CustomText(
          text: "Apply",
          color: CustomColors().colorB7B7B7,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  ///this widget is responsible to build filter brand lists in filter ui
  Widget _brandNamesForFilter(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Brand",
            color: CustomColors().color3B3B3B,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: viewModel.model.brandListFromApi.length,
            itemBuilder: (ctx, index){
              return _brandRowUi(
                  viewModel.model.brandListFromApi[index]
              );
            },
          ),
        ],
      ),
    );
  }

  ///this widget is responsible to build filter brand row in filter ui
  ///take [name] as positional param
  Widget _brandRowUi(String name){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value){

          }),
          5.pw,
          ClipOval(
              child: Image.network(
                "https://randomuser.me/api/portraits/men/1.jpg",
                fit: BoxFit.contain,
                height: 40,
                errorBuilder: (ctx, obj, stack) {
                  return const Icon(Icons.person);
                },
              )),
          5.pw,
          CustomText(
            text: name,
            color: CustomColors().color797979,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  ///this widget is responsible to build filter priority dropdown in filter ui
  Widget _priorityFilterDropdown(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: "Priority",
            color: CustomColors().color3B3B3B,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          CustomContainer(
            borderRadius: 15,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.all(10),
            borderColor: CustomColors().color3B3B3B,
            borderWidth: 1,
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: 'Select Priority',
                icon: const Icon(Icons.keyboard_arrow_down),
                items: viewModel.model.priorityListFromApi.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {

                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///this widget is responsible to build filter tags in filter ui
  Widget _searchTagUi(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: "Tags",
            color: CustomColors().color3B3B3B,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          10.ph,
          CustomContainer(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              borderRadius: 15,
              backGroundColor: CustomColors().colorF9FAFB,
              alignment: Alignment.centerLeft,
              borderColor: CustomColors().color797979.withOpacity(0.3),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Tags",
                  prefixIcon: Icon(Icons.search, color: CustomColors().color3B3B3B),
                  border: InputBorder.none,
                ),
                onChanged: (String value){

                },
              )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: viewModel.model.tagsListFromApi.map((String item) {
                return Chip(
                  label: Text(item),
                  backgroundColor:  CustomColors().colorF9FAFB,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
