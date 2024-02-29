import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_text.dart';

class EditprofileScreen extends StatefulWidget {
  const EditprofileScreen({super.key});

  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen> {
  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _locationController = TextEditingController();
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
      body: Padding(
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
                          radius: 70.r, backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                          radius: 70.r,
                          backgroundImage: const NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                        ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                          onTap: () {
                            showImagePickerOption(context);
                          },
                          child: SvgPicture.asset(AppIcons.groupEdit)))
                ],
              ),
            ),
            SizedBox(height: 24.h),
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
              prifixicon: _prefixIcon(AppIcons.cake),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: 'Enter your email',
              prifixicon: _prefixIcon(AppIcons.mail),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _phoneNumberController,
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: '(406) 555-0120',
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
            const Spacer(),
            CustomButton(title: AppString.update, onpress: () {}),
            SizedBox(height: 69.h),
          ],
        ),
      ),
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

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
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

//Gallery
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

//Camera
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
}
