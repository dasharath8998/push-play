import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pushplay/routes/app_routes.dart';
import 'package:pushplay/utils/color_constants.dart';
import 'package:pushplay/utils/icon_constant.dart';
import 'package:pushplay/utils/size_utils.dart';

class AuthHomePage extends StatefulWidget {
  const AuthHomePage({Key? key}) : super(key: key);

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeUtils.get(15)),
                    child: Text('Hello,',
                        style: themeData.textTheme.headlineLarge)),
                Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Image.asset(IconsConstant.ellipse),
                          Padding(
                            padding: EdgeInsets.only(top: SizeUtils.get(24)),
                            child: Image.asset(
                              IconsConstant.airplane,
                              width: SizeUtils.get(SizeUtils.screenWidth! - 90),
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(height: SizeUtils.get(12)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.get(15)),
                  child: Text('Let\'s \nget started',
                      style: themeData.textTheme.displayMedium),
                ),
                SizedBox(height: SizeUtils.get(16)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.get(15)),
                  child: Text('Everything start from here',
                      style: themeData.textTheme.bodyLarge),
                ),
                SizedBox(height: SizeUtils.get(34)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.get(15)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: ColorConstants.themeYellow,
                          padding: EdgeInsets.symmetric(
                              vertical: SizeUtils.get(10))),
                      onPressed: () {
                        context.push(Routes.login);
                      },
                      child: Text('Log in',
                          style: themeData.textTheme.titleLarge)),
                ),
                SizedBox(height: SizeUtils.get(16)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeUtils.get(15)),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding:
                            EdgeInsets.symmetric(vertical: SizeUtils.get(10)),
                        backgroundColor: ColorConstants.ellipseColorYellow,
                      ),
                      onPressed: () {
                        context.push(Routes.signup);
                      },
                      child: Text('Sign up',
                          style: themeData.textTheme.titleLarge)),
                ),
                SizedBox(height: SizeUtils.get(16)),
              ],
            ),
          ),
        ),
        backgroundColor: ColorConstants.darkBlack);
  }
}
