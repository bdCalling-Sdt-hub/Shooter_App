import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/profileController.dart';
import '../../../controller/registration_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import 'inner_widgets/drop_down_container.dart';


class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final RegistrationController registrationController =
      Get.put(RegistrationController());
  final ProfileController _profileController = Get.put(ProfileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /*void _handleRadioValueChange(String value) {
    setState(() {
      groupValue = value;
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileController.getProfileData();
    var profileData = _profileController.profileModel.value.data?.attributes;
    registrationController.nameController.text = profileData!.name ?? '';
    registrationController.emailController.text = "${profileData.email}";
    registrationController.clubNameController.text = "${profileData.club}";
    registrationController.phoneNumberController.text = "${profileData.phone}";
  }

  var parameter = Get.parameters;
  String isDropDownItem = "";

  Set<int> selectedIndexes = Set<int>();
  List<int> ss = [1, 2, 3, 4, 5];
  var matches = Get.arguments;
  @override
  Widget build(BuildContext context) {
   print("=====> ${matches}");
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.registration,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _formFieldSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //================================>TextFormField Section <=======================
  _formFieldSection() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: AppString.fullName, bottom: 8.h),
          CustomTextField(
            readOnly: true,
            controller: registrationController.nameController,
            contenpaddingHorizontal: 12.w,
            contenpaddingVertical: 16.h,
            hintText: AppString.fullName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please update your profile";
              }
              return null;
            },
          ),
          CustomText(text: AppString.email, bottom: 8.h, top: 16.h),
          CustomTextField(
            readOnly: true,
            controller: registrationController.emailController,
            keyboardType: TextInputType.emailAddress,
            contenpaddingHorizontal: 12.w,
            contenpaddingVertical: 16.h,
            hintText: AppString.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please update your profile";
              }
              return null;
            },
          ),
          CustomText(text: AppString.phoneNumber, bottom: 8.h, top: 16.h),

          CustomTextField(
            readOnly:
                _profileController.profileModel.value.data?.attributes?.phone ==
                        ''
                    ? false
                    : true,
            keyboardType: TextInputType.phone,
            controller: registrationController.phoneNumberController,
            contenpaddingHorizontal: 12.w,
            contenpaddingVertical: 16.h,
            hintText: AppString.phoneNumber,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please update your profile";
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          CustomText(text: AppString.gender),
          //======================================>   Radio  Button Section <==============================
          Row(
            children: [
              Radio(
                  value: AppString.male,
                  activeColor: AppColors.primaryColor,
                  groupValue: registrationController.groupValue,
                  onChanged: (value) {
                    setState(() {
                      registrationController.groupValue = value!;
                    });
                  }),
              CustomText(
                text: AppString.male,
                fontsize: 16.h,
              ),
              SizedBox(width: 16.w),
              Radio(
                  value: AppString.female,
                  activeColor: AppColors.primaryColor,
                  groupValue: registrationController.groupValue,
                  onChanged: (value) {
                    setState(() {
                      registrationController.groupValue = value!;
                    });
                  }),
              CustomText(
                text: AppString.female,
                fontsize: 16.h,
              ),
            ],
          ),

          CustomText(text: AppString.shooterShoulderPreference),
          //======================================>   Radio  Button Section <==============================
          Row(
            children: [
              Radio(
                  value: AppString.male,
                  activeColor: AppColors.primaryColor,
                  groupValue: registrationController.shootterShoulder,
                  onChanged: (value) {
                    setState(() {
                      registrationController.shootterShoulder = value!;
                    });
                  }),
              CustomText(
                text: AppString.left,
                fontsize: 16.h,
              ),
              SizedBox(width: 16.w),
              Radio(
                  value: AppString.female,
                  activeColor: AppColors.primaryColor,
                  groupValue: registrationController.shootterShoulder,
                  onChanged: (value) {
                    setState(() {
                      registrationController.shootterShoulder = value!;
                    });
                  }),
              CustomText(
                text: AppString.right,
                fontsize: 16.h,
              ),
            ],
          ),

          CustomText(text: AppString.age, bottom: 8.h, top: 16.h),

          CustomTextField(
            keyboardType: TextInputType.number,
            controller: registrationController.ageController,
            contenpaddingHorizontal: 12.w,
            contenpaddingVertical: 16.h,
            hintText: AppString.age,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter your age";
              }
              return null;
            },
          ),
          CustomText(text: AppString.clubName, bottom: 8.h, top: 16.h),

          CustomTextField(
            readOnly: false,
            controller: registrationController.clubNameController,
            contenpaddingHorizontal: 12.w,
            contenpaddingVertical: 16.h,
            hintText: AppString.clubName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please update your profile";
              }
              return null;
            },
          ),

          ///======================drop down =======================>
          CustomText(text: AppString.classChoose, bottom: 8.h, top: 16.h),
          DropDownContainer(
            isDropDownItem: isDropDownItem,
            dropDownItemsList: const ['a', "b", 'c'],
          ),

          CustomText(text: AppString.matchChoose, bottom: 8.h, top: 16.h),

          SizedBox(
            height: (40 * matches.length).toDouble(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: matches.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndexes.contains(index);
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedIndexes.remove(index);
                      } else {
                        selectedIndexes.add(index);
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.5.h),
                    child: Row(
                      children: [

                        isSelected ?
                            Container(
                              height: 28.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(color: Colors.red)
                              ),
                            ) :

                        Container(
                          decoration: BoxDecoration(
                              color:  Colors.red,
                              borderRadius: BorderRadius.circular(4.r)),
                          child:Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.h, vertical: 1.h),
                                  child: const Icon(Icons.done,
                                      color: Colors.white),
                                )
                        ),


                        CustomText(
                          text: '${matches[index].matchName}',
                          fontsize: 16.h,
                          left: 8.w,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 50.h),
          CustomButton(
            title: AppString.makePayment,
            titlecolor: Colors.white,
            loading: registrationController.submitFromLoading.value,
            onpress: () {
              if (_formKey.currentState!.validate()) {
                registrationController.submitForm(
                    context,
                    '${parameter['matchId']}',
                    '${parameter['price']}',
                    '${parameter['matchName']}');
              }
            },
          ),
          SizedBox(height: 74.h),
        ],
      ),
    );
  }
}
