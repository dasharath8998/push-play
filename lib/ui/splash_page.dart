import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pushplay/routes/app_routes.dart';
import 'package:pushplay/utils/color_constants.dart';
import 'package:pushplay/utils/icon_constant.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
  }

  void startTimer() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      context.pushReplacement(Routes.authHomepage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.darkBlack,
        body: Center(child: Image.asset(IconsConstant.logo)));
  }
}
