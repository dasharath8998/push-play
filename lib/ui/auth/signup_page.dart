import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pushplay/routes/app_routes.dart';
import 'package:pushplay/utils/color_constants.dart';
import 'package:pushplay/utils/icon_constant.dart';
import 'package:pushplay/utils/size_utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.get(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: () {
                  context.pop();
                }, icon: Image.asset(IconsConstant.back)),
                SizedBox(height: SizeUtils.get(18)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeUtils.get(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Welcome back',
                            style: themeData.textTheme.headlineMedium),
                        SizedBox(height: SizeUtils.get(4)),
                        Text('Sign up to get started!',
                            style: themeData.textTheme.bodyMedium),
                        SizedBox(height: SizeUtils.get(18)),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Full name',
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  IconsConstant.user,
                                  height: 10,
                                  width: 10,
                                ),
                              )),
                        ),
                        SizedBox(height: SizeUtils.get(18)),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Email or username',
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  IconsConstant.user,
                                  height: 10,
                                  width: 10,
                                ),
                              )),
                        ),
                        SizedBox(height: SizeUtils.get(14)),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  IconsConstant.lock,
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off_outlined))),
                        ),
                        SizedBox(height: SizeUtils.get(14)),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  IconsConstant.lock,
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off_outlined))),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: Text('Forgot Password?',
                                  style: themeData.textTheme.bodySmall)),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: ColorConstants.themeYellow,
                                padding: EdgeInsets.symmetric(vertical: SizeUtils.get(10))
                            ),
                            onPressed: () {
                              context.push(Routes.login);
                            },
                            child: Text('Sign up',
                                style: themeData.textTheme.titleLarge)),
                        SizedBox(height: SizeUtils.get(14)),
                        const Spacer(),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Already member? ',
                                    style: themeData.textTheme.bodyLarge?.copyWith(
                                        color: ColorConstants.themeTextColor)),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    context.pushReplacement(Routes.login);
                                  },
                                  text: 'Login',
                                  style: themeData.textTheme.bodyLarge!.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: ColorConstants.themeTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: SizeUtils.get(14)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
