import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:shooter_app/controller/profileController.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_constants.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   final _userClassController = TextEditingController();
  final _clubController = TextEditingController();
  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _locationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      var profileData =    _profileController.profileModel.value.data?.attributes;
      _userClassController.text = "${profileData?.userClass}";
      _clubController.text = "${profileData?.club}";
      _nameController.text = "${profileData?.name}";
      _dateOfBirthController.text = profileData?.dateOfBirth == null ? "" : "${profileData?.dateOfBirth}";
      _phoneNumberController.text = "${profileData?.phone}";
      _locationController.text = "${profileData?.address}";
    });
  }

  Uint8List? _image;
  File? selectedIMage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.editProfile,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
      var profileData =    _profileController.profileModel.value.data?.attributes;

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
                        radius:  60.r, backgroundImage:  MemoryImage(_image!))
                        : CircleAvatar(
                      radius: 60.r,
                      backgroundImage:  NetworkImage(
                          // "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
                          "${ApiConstant.imageBaseUrl}/${profileData?.image?.destination}/${profileData?.image?.filename}"
                      ),
                    ),
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
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 165.w,
                      child: CustomTextField(
                        controller: _userClassController,
                        contenpaddingHorizontal: 20.w,
                        contenpaddingVertical: 9.h,
                        hintText: AppString.clasName,
                      ),
                    ),
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
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _nameController,
                  contenpaddingHorizontal: 12.w,
                  contenpaddingVertical: 16.h,
                  hintText: 'Enter your name',
                  prifixicon: _prefixIcon(AppIcons.user),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _dateOfBirthController,
                  contenpaddingHorizontal: 12.w,
                  contenpaddingVertical: 16.h,
                  hintText: 'Enter your date of birth',
                  prifixicon: _prefixIcon(AppIcons.calander),

                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  controller: _phoneNumberController,
                  contenpaddingHorizontal: 12.w,
                  contenpaddingVertical: 16.h,
                  hintText: '(000) 000-0000',
                  prifixicon: _prefixIcon(AppIcons.phone),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: _locationController,
                  contenpaddingHorizontal: 12.w,
                  contenpaddingVertical: 16.h,
                  hintText: "Enter your location",
                  prifixicon: _prefixIcon(
                    AppIcons.locationMarker,
                  ),
                ),
              ],)),
              const Spacer(),
              Obx(()=> CustomButton(title: AppString.update,
                  loading: _profileController.loading.value,
                  onpress: () {
                  _profileController.editProfile(
                      _nameController.text,
                      _phoneNumberController.text,
                      _locationController.text,
                      _clubController.text,
                      _userClassController.text,
                      _dateOfBirthController.text,
                      selectedIMage
                  );

                }),
              ),
              SizedBox(height: 69.h),
            ],
          ),
        );
      }),
    );
  }

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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.2,
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
    Navigator.of(context).pop(); //close the model sheet
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
    // Navigator.of(context).pop();
  }

  ///----------------------------------calender-------------------------------->
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateOfBirthController.text = DateFormat('MM/dd/yyyy').format(_selectedDate);
        /*dateCtrl.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";*/
        // date = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
      print('Selected date: ${_dateOfBirthController.text}');
    }
  }
}
