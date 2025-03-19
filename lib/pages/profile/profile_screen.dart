import 'package:get/get.dart';
import '../../index.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileViewModel viewModel = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.ph,
            CustomAppBar(title: 'My Profile', showNotification: false),
            Expanded(
              child: Obx(() {
                return Column(
                  mainAxisAlignment:(viewModel.model.profile.value == null)? MainAxisAlignment.center : MainAxisAlignment.start,
                  crossAxisAlignment:(viewModel.model.profile.value == null)? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    if (viewModel.model.profile.value == null)...[const Center(child: CircularProgressIndicator())]// Show loading until profile is fetched
                    else ...[
                      _profileHeaderUi(viewModel.model.profile.value!),
                      10.ph,
                      _basicInfoUi(viewModel.model.profile.value!),
                      10.ph,
                      _assignedRoleList(viewModel.model.profile.value!),
                      const Spacer(),
                      _logOutButton(),
                    ]
                  ],
                );
              }),
            )
          ],
        ),
        bottomNavigationBar: CustomBottomBar(currentIndex: 2));
  }

  Widget _roundImage(String url, double height){
   return ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.contain,
          height: height,
          errorBuilder: (ctx, obj, stack) {
            return const Icon(Icons.person);
          },
        ));
  }

  Widget _profileHeaderUi(ContactEntity profile){
    return CustomContainer(
      backGroundColor: CustomColors().colorD8E0ED,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          _roundImage(profile.imageUrl??'', 60),
          10.pw,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: profile.name ?? '',
                color: CustomColors().color3B3B3B,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: profile.department ?? '',
                color: CustomColors().colorB7B7B7,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {

            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.edit_note_rounded, size: 35),
            ),
          )
        ],
      ),
    );
  }

  Widget _basicInfoUi(ContactEntity profile){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Basic Info',
            color: CustomColors().color797979,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          _infoColumn(header: 'First Name', value:  (profile.name??'').split(' ').first),
          _infoColumn(header: 'Last Name', value:  (profile.name??'').split(' ')[1]),
          _infoColumn(header: 'Email', value:  profile.email??''),
        ],
      ),
    );
  }

  Widget _infoColumn({String header = '', String value = '', String url = ''}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: header,
          color: CustomColors().colorB7B7B7,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        Row(
          children: [
            if(url.isNotEmpty)_roundImage(url, 30),
            if(url.isNotEmpty)5.pw,
            CustomText(
              text: value,
              color: CustomColors().color3B3B3B,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ],
        )
      ],
      ),
    );
  }

  Widget _assignedRoleList(ContactEntity profile){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: CustomText(
            text: 'Assigned Roles (${viewModel.model.profile.value!.roles?.length})',
            color: CustomColors().color797979,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        10.ph,
        SizedBox(
          height: 192,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (profile.roles??[]).length,
            itemBuilder: (ctx, index){
              Roles role = profile.roles![index];
              return _roleCardUi(role);
            },
          ),
        ),
      ],
    );
  }

  Widget _roleCardUi(Roles role){
    return CustomContainer(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
      width: 280,
      borderRadius: 8,
      backGroundColor: CustomColors().colorF9FAFB,
      borderColor: CustomColors().color797979.withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: role.name??'',
            color: CustomColors().color3B3B3B,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          const Divider(),
          _infoColumn(header: 'Group', value: role.group??''),
          _infoColumn(header: 'Manager', value: role.managerName??'', url: role.managerImage??''),
        ],
      ),
    );

  }

  Widget _logOutButton(){
    return CustomContainer(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        borderRadius: 15,
        backGroundColor: CustomColors().colorFE475B.withOpacity(0.12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, color: CustomColors().colorFE475B),
            10.pw,
            CustomText(
              text: "Log out",
              color: CustomColors().colorFE475B,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )
          ],
        )
    );
  }
}