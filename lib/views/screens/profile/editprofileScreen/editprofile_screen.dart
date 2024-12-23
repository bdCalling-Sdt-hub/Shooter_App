import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shooter_app/controller/profileController.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_text.dart';

class EditprofileScreen extends StatefulWidget {
  const EditprofileScreen({super.key});

  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen> {
  final ProfileController _profileController = Get.put(ProfileController());


  final _userClassController = TextEditingController();
  final _clubController = TextEditingController();
  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _locationController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      var profileData = _profileController.profileModel.value.data?.attributes;
      _userClassController.text = "${profileData?.userClass}";
      _clubController.text = "${profileData?.club}";
      _nameController.text = "${profileData?.name}";
      _dateOfBirthController.text =
      profileData?.dateOfBirth == null ? "" : TimeFormatHelper.formatDate(profileData!.dateOfBirth!);
      _phoneNumberController.text = "${profileData?.phone}";
      _locationController.text = "${profileData?.address}";
    });
  }

  Uint8List? _image;
  File? selectedIMage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.editProfile,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          var profileData =
              _profileController.profileModel.value.data?.attributes;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 22.h),
                Center(
                  child: Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                          radius: 60.r,
                          backgroundImage: MemoryImage(_image!))
                          : Container(
                        clipBehavior: Clip.antiAlias,
                        height: 100.h,
                          width: 100.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle
                          ),
                          child :  profileData?.image?.publicFileUrl == null || profileData?.image?.publicFileUrl == '' ?
                          CachedNetworkImage(
                             imageUrl:  "${ApiConstant.imageBaseUrl}/${profileData?.image
                                  ?.publicFileUrl}",fit: BoxFit.cover,)
                              : CachedNetworkImage(
                             imageUrl:  "${ApiConstant.imageBaseUrl}/${profileData?.image
                                  ?.publicFileUrl}",fit: BoxFit.cover,)),
                      Positioned(
                          bottom: 12.h,
                          right: 0.w,
                          child: GestureDetector(
                              onTap: () {
                                showImagePickerOption(context);
                              },
                              child: SvgPicture.asset(AppIcons.groupEdit)))
                    ],
                  ),
                ),
                //======================================> Text From Field Section <===============================================
                Column(
                  children: [
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //======================> Class Field <=========================
                        SizedBox(
                          width: 165.w,
                          child: CustomTextField(
                            controller: _userClassController,
                            contenpaddingHorizontal: 20.w,
                            contenpaddingVertical: 9.h,
                            hintText: AppString.clasName,
                          ),
                        ),
                        //======================> Club Field <=========================
                        SizedBox(
                          width: 165.w,
                          child: CustomTextField(
                            controller: _clubController,
                            contenpaddingHorizontal: 20.w,
                            contenpaddingVertical: 9.h,
                            hintText: AppString.clubNameS,
                          ),
                        ),
                      ],
                    ),
                    //======================> Name Field <=========================
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: _nameController,
                      contenpaddingHorizontal: 12.w,
                      contenpaddingVertical: 16.h,
                      hintText: 'Enter your name',
                      prifixicon: _prefixIcon(AppIcons.user),
                    ),
                    //======================> Date of Birth Field <=========================
                    SizedBox(height: 16.h),
                    CustomTextField(
                      onTab: () {
                        selectDate(context);
                      },
                      readOnly: true,
                      controller: _dateOfBirthController,
                      contenpaddingHorizontal: 12.w,
                      contenpaddingVertical: 16.h,
                      hintText: 'Enter your date of birth',
                      prifixicon: _prefixIcon(AppIcons.calander),
                    ),
                    //======================> Phone Number Field <=========================
                    SizedBox(height: 16.h),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: _phoneNumberController,
                      contenpaddingHorizontal: 12.w,
                      contenpaddingVertical: 16.h,
                      hintText: '(000) 000-0000',
                      prifixicon: _prefixIcon(AppIcons.phone),
                    ),
                    //======================> Location Field <=========================
                    SizedBox(height: 16.h),
                    CustomTextField(
                      controller: _locationController,
                      contenpaddingHorizontal: 12.w,
                      contenpaddingVertical: 16.h,
                      hintText: "Enter your address",
                      prifixicon: _prefixIcon(
                        AppIcons.locationMarker,
                      ),
                    ),
                  ],
                ),
                // const Spacer(),
                SizedBox(height: 100.h),
                //======================> Update Button <=========================
                Obx(
                      () =>
                      CustomButton(
                          title: AppString.update,
                          loading: _profileController.loading.value,
                          onpress: () {
                            _profileController.editProfile(
                                _nameController.text,
                                _phoneNumberController.text,
                                _locationController.text,
                                _clubController.text,
                                _userClassController.text,
                                _dateOfBirthController.text,
                                selectedIMage);
                          }),
                ),
                SizedBox(height: 70.h),
              ],
            ),
          );
        }),
      ),
    );
  }

//======================> Prefix Icon Method <=========================
  _prefixIcon(String icon) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 16.w),
      child: SvgPicture.asset(
        icon,
        fit: BoxFit.contain,
        color: Colors.white,
      ),
    );
  }

  //==================================> ShowImagePickerOption Function <===============================

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColors.backgroundColor,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 4.2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 50.w,
                            ),
                            const CustomText(text: 'Gallery')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 50.w,
                            ),
                            const CustomText(text: 'Camera')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //==================================> Gallery <===============================
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Get.back();
  }

//==================================> Camera <===============================
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // Get.back();
  }

  //==================================> Calender <==================================
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      _dateOfBirthController.text =
          DateFormat('yyyy-MM-dd').format(selectedDate!);
      print('Selected date: ${_dateOfBirthController.text}');
    }
  }
}
