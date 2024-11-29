import 'package:flutter/material.dart';
import 'package:flutter_tem/components/toast/toast.dart';
import 'package:flutter_tem/features/auth/widget/text_input_number.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter_tem/utils/image/app_image.dart';
import 'package:flutter_tem/utils/theme/app_colors.dart';
import 'package:flutter_tem/utils/theme/app_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FocusScope(
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            // Dismiss the keyboard when tapping outside of the TextField
            FocusScope.of(context).unfocus();
          }
        },
        child: GestureDetector(
          onTap: () {
            // Dismiss the keyboard when tapping outside of the TextField
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppImage.loginBg,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.black.withOpacity(0.6),
                          AppColors.black.withOpacity(0.6)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to,',
                              style: AppText.title(
                                color: AppColors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Tiffany Furniture Company',
                              style: AppText.title(
                                color: AppColors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Please login to continue your purchase!',
                              style: AppText.title(
                                color: AppColors.white.withOpacity(0.75),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ), // Space between text and text fields

                            Container(
                              height: 48,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.white, // Underline color
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: const TextInputNumber(
                                hintText: "Enter Phone number ",
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ), // Space between email and password fields

                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: AppColors
                                              .white, // Underline color
                                          width: 1, // Underline thickness
                                        ),
                                      ),
                                    ),
                                    child: const TextInputNumber(
                                      hintText: "Enter OTP Code ",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ), // Space between TextField and button
                                ElevatedButton(
                                  onPressed: () {
                                    ToastUtils.showToast(
                                      message: "Hello, this is a custom toast!",
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.black, // Background color
                                    foregroundColor: Colors.white, // Text color
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, // Horizontal padding
                                    ),
                                    elevation: 5, // Button shadow
                                    fixedSize: const Size(double.infinity, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        4,
                                      ), // Rounded corners
                                    ),
                                  ),
                                  child: const Text("Send Code"),
                                )
                              ],
                            ),

                            const SizedBox(
                              height: 16,
                            ), // Space between password and button

                            // Login Button
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  'Continue',
                                  style: AppText.title(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'or continue purchase as a guest?',
                                  style: AppText.title(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                    underline: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
