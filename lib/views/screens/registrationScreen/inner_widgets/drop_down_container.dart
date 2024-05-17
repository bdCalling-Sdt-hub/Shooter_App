import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/registration_controller.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_text.dart';

class DropDownContainer extends StatefulWidget {
  final List? dropDownItemsList;

  DropDownContainer(
      {super.key, this.dropDownItemsList});

  @override
  State<DropDownContainer> createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {

  ScrollController scrollController = ScrollController();

  bool isDropDown = false;
  // String dropDownItemName = "";

  final RegistrationController _registrationController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        isDropDown
            ? Container(
                height: 240.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 30.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              topRight: Radius.circular(8.r))),
                      child: CustomText(
                          text: "Class",
                          textAlign: TextAlign.start,
                          left: 16.w,
                          top: 3.h),
                    ),
                    Expanded(
                      child: Scrollbar(
                        controller: scrollController,
                        // thumbVisibility: true,
                        thickness: 4,
                        child: ListView.builder(
                          itemCount: widget.dropDownItemsList?.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 40.h,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                onTap: () {
                                  setState(() {
                                  _registrationController. dropDownItemName =
                                        '${widget.dropDownItemsList?[index]}';
                                    isDropDown = false;
                                  });
                                },
                                title: CustomText(
                                  text: '${widget.dropDownItemsList?[index]}',
                                  color: AppColors.primaryColor,
                                  textAlign: TextAlign.start,
                                  left: 16.w,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    isDropDown = true;
                  });
                },
                child: Container(
                  height: 56.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Color(0xFF716665),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: _registrationController. dropDownItemName != ''
                              ?_registrationController. dropDownItemName
                              : "Class",
                          color: AppColors.whiteB5B5B5,
                          fontsize: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: SvgPicture.asset(AppIcons.dropDown,
                              color: AppColors.whiteB5B5B5),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
