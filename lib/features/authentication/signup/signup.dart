import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:preo/common/widgets/app_text_formfield.dart';
import 'package:preo/common/widgets/primary_button.dart';
import 'package:preo/common/widgets/stepper.dart';
import 'package:preo/features/authentication/auth_controller.dart';
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    final bool keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return GestureDetector(
      onTap: () => DeviceUtils.hideKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.bgColor,
            surfaceTintColor: AppColors.bgColor,
            title: AppStepper(index: 0),
            // scrolledUnderElevation: 0,
            automaticallyImplyLeading: false),
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
                              SizedBox(height: Sizes.spaceBtwItems),
                              AppTextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: 'Email Address',
                                validator: ValidationBuilder()
                                    .email()
                                    .maxLength(50)
                                    .build(),
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              Obx(
                                () => AppTextFormField(
                                  labelText: 'Password',
                                  obscureText: authController.password.value,
                                  validator: (password) {
                                    // Trigger password validation in real-time
                                    authController.checkPassword(password!);
                                    return null;
                                  },
                                  onChanged: (password) {
                                    authController.checkPassword(password);
                                  },
                                  suffixIcon: IconButton(
                                    icon: SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: SvgPicture.asset(
                                        authController.password.value
                                            ? Images.eyeSlashIcon
                                            : Images.eyeIcon,
                                      ),
                                    ),
                                    onPressed: () {
                                      authController.seePassword();
                                    },
                                  ),
                                ),
                              ),
                              Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 4.h),
                                    _buildValidationMessage(
                                      'Must be at least 8 characters',
                                      authController.hasMinLength.value,
                                    ),
                                    _buildValidationMessage(
                                      'Can not include your name or eamil address',
                                      authController.hasUpperCase.value,
                                    ),
                                    _buildValidationMessage(
                                      'Must have at least one symbol or number',
                                      authController.hasLowerCase.value,
                                    ),
                                    _buildValidationMessage(
                                      'Can not contain spaces',
                                      authController.hasSpecialCharacter.value,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              Obx(
                                () => AppTextFormField(
                                  labelText: 'Confirm Password',
                                  obscureText:
                                      authController.confirmPassword.value,
                                  suffixIcon: IconButton(
                                    icon: SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: SvgPicture.asset(
                                        authController.confirmPassword.value
                                            ? Images.eyeSlashIcon
                                            : Images.eyeIcon,
                                      ),
                                    ),
                                    onPressed: () {
                                      authController.seeConfirmPassword();
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: Sizes.spaceBtwItems),
                              GestureDetector(
                                onTap: () => _selectDate(context),
                                child: AbsorbPointer(
                                  child: AppTextFormField(
                                    controller: _dobController,
                                    labelText: 'Date',
                                    isReadOnly: true,
                                    suffixIcon: IconButton(
                                      icon: SizedBox(
                                        height: 24.h,
                                        width: 24.w,
                                        child:
                                            SvgPicture.asset(Images.calendar),
                                      ),
                                      onPressed: () {},
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
                                // Get.toNamed(Routes.getLoginRoute());
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

  Widget _buildValidationMessage(String message, bool isValid) {
    // if (isValid) return SizedBox.shrink();
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: AppColors.neutral900,
          size: 16,
        ),
        SizedBox(width: 8),
        Text(
          message,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.neutral900,
          ),
        ),
      ],
    );
  }
}
