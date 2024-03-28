import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_news_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_news_app_clone/AppUtils/shared_pref_data_handler.dart';
import 'package:flutter_news_app_clone/Presentation/Screens/home_page_screen.dart';
import 'package:flutter_news_app_clone/Presentation/Screens/onboarding_screen.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/app_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferenceDataHandler dataHandler = SharedPreferenceDataHandler();
  String doneOnboarding = "";
  String setdoneOnboarding = "";

  void readData() async {
    doneOnboarding =
        await dataHandler.getStringValue(AppStrings.doneOnboarding);

    setState(() {
      setdoneOnboarding = doneOnboarding;
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              // (context) => const HomeScreen()
              (context) => setdoneOnboarding.toString() == AppStrings.yes
                  ? HomePageScreen()
                  : OnboardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextWidget(
              text: AppStrings.highLight,
              fontSize: 28.0,
              color: AppColors.blackColor,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 100,
            ),
            CupertinoActivityIndicator()
          ],
        ),
      ),
    );
  }
}
