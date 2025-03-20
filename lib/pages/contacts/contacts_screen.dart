import 'package:get/get.dart';
import '../../index.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({super.key});

  final ContactsViewModel viewModel = Get.put(ContactsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.ph,
            CustomAppBar(title: 'Gain Solutions', showNotification: true),
            _searchUi(),
            _contactCountUi(),
            Expanded(
              child: Obx(() {
                if (viewModel.model.contactList.isEmpty) {
                  return const Center(child: CircularProgressIndicator()); // Show loading until Contactss are fetched
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: viewModel.model.contactList.length,
                  itemBuilder: (context, index) {
                    final contact = viewModel.model.contactList[index];
                    return _contactCard(contact);
                  },
                );
              }),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomBar(currentIndex: 1));
  }

  Widget _contactCountUi(){
    return Obx(() => Padding(
      padding: const EdgeInsets.all(10),
      child: CustomText(
        text: "${viewModel.model.contactList.length} Contacts",
        color: CustomColors().colorB7B7B7,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ));
  }

  Widget _contactCard(ContactEntity contactEntity) {
    return Obx(() {
      return Stack(
        children: [
          CustomContainer(
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
                _contactHeader(contactEntity),
                10.ph,
                _contactInfoRowUi(icon: Icon(Icons.email_outlined, size: 25, color: CustomColors().colorB7B7B7), info: contactEntity.email ?? 'No email found'),
                3.ph,
                _contactInfoRowUi(icon: Icon(Icons.call_outlined, size: 25, color: CustomColors().colorB7B7B7), info: contactEntity.phone ?? 'No email found'),
                3.ph,
                _contactInfoRowUi(icon: Icon(Icons.location_on_outlined, size: 25, color: CustomColors().colorB7B7B7), info: contactEntity.address ?? 'No email found'),
              ],
            ),
          ),
          if(viewModel.model.activeCardIndex.value == contactEntity.id) _morePopUpUi()
        ],
      );
    });
  }

  Widget _contactHeader(ContactEntity contactEntity) {
    return Row(
      children: [
        CustomContainer(
          height: 50,
          width: 50,
          borderRadius: 50,
          borderWidth: 1,
          padding: const EdgeInsets.all(2),
          borderColor: CustomColors().colorB7B7B7,
          child: ClipOval(
              child: Image.network(
            contactEntity.imageUrl ?? '',
            fit: BoxFit.contain,
            errorBuilder: (ctx, obj, stack) {
              return const Icon(Icons.person);
            },
          )),
        ),
        10.pw,
        CustomText(
          text: contactEntity.name ?? '',
          color: CustomColors().color3B3B3B,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            viewModel.model.activeCardIndex.value =  viewModel.model.activeCardIndex.value == contactEntity.id ? -1 : contactEntity.id;
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.more_vert),
          ),
        )
      ],
    );
  }

  Widget _contactInfoRowUi({required Widget icon, required String info}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        5.pw,
        CustomText(
          text: info,
          color: CustomColors().colorB7B7B7,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _morePopUpUi() {
    return Positioned(
      right: 40,
      bottom: 5,
      child: CustomContainer(
          backGroundColor: CustomColors().white,
          width: 200,
          height: 120,
          borderRadius: 8,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                text: 'Edit',
                color: CustomColors().color3B3B3B,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: 'View Tickets',
                color: CustomColors().color3B3B3B,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: 'Delete',
                color: CustomColors().color3B3B3B,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ],
          )
      ),
    );
  }

  Widget _searchUi(){
    return CustomContainer(
      margin: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
      borderRadius: 15,
      backGroundColor: CustomColors().colorF9FAFB,
      alignment: Alignment.centerLeft,
      borderColor: CustomColors().color797979.withOpacity(0.3),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Contacts",
          prefixIcon: Icon(Icons.search, color: CustomColors().color3B3B3B),
          border: InputBorder.none,
        ),
        onChanged: (String value){

        },
      )
    );
  }
}
