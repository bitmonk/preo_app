import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/custom_form_field.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/common/widgets/stepper.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/images.dart';
import 'package:preo/utils/constants/sizes.dart';
import 'package:preo/utils/device/device_utils.dart';
import 'package:preo/utils/routes/routes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _dobController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        _dobController.text = '${selectedDate.toLocal()}'.split(' ')[0];
        print(_dobController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return GestureDetector(
      onTap: () => DeviceUtils.hideKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.bgColor,
          title: AppStepper(index: 0),
        ),
        body: SafeArea(
          child: Container(
            color: AppColors.bgColor,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 34.h),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 32.h),
                            child: Image(
                              image: AssetImage(Images.logoBlack),
                              height: 112.h,
                              width: 103.w,
                            ),
                          ),
                          SizedBox(
                            height: Sizes.spaceBtwSections,
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: Sizes.heading,
                              fontWeight: Sizes.font6,
                              color: AppColors.titleColor,
                            ),
                          ),
                          SizedBox(
                            height: Sizes.defaultSpace,
                          ),
                          Column(
                            children: [
                              FormInputField(
                                labelText: 'Name',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              FormInputField(
                                labelText: 'Email Address',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              FormInputField(
                                labelText: 'Password',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              FormInputField(
                                labelText: 'Confirm Password',
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    validator: (value) {
                                      // // final error =
                                      // //     ValidationBuilder().build()(value);
                                      // // setState(() {
                                      // //   _isDobValid = error == null;
                                      // // });
                                      // return error;
                                    },
                                    controller: _dobController,
                                    decoration: InputDecoration(
                                      labelText: 'Date of Birth',
                                      labelStyle: TextStyle(
                                        color: AppColors.formTextColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: AppColors.neutral400),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24.w,
                                        vertical: 18.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  if (!keyboardVisible)
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(
                              btnText: 'Continue',
                              onPressed: () {
                                Get.toNamed(Routes.getLoginRoute());
                              },
                            ),
                          ),
                          SizedBox(
                            height: Sizes.mdSpace,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.getLoginRoute()),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.titleColor),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Do you have account? ',
                                    ),
                                    TextSpan(
                                      text: 'Sign In',
                                      style:
                                          TextStyle(color: AppColors.primary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
