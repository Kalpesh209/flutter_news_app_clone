import 'package:flutter/material.dart';
import 'package:flutter_news_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_news_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_news_app_clone/AppUtils/shared_pref_data_handler.dart';
import 'package:flutter_news_app_clone/Presentation/Screens/splash_screen.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/app_text_widget.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/profile_card_widget.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/text_button_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SharedPreferenceDataHandler dataHandler = SharedPreferenceDataHandler();

  String lang = "";
  String setLang = "";

  String langCode = "";
  String setLangCode = "";

  String country = "";
  String setCountry = "";

  String countryCode = "";
  String setCountryCode = "";

  @override
  void initState() {
    super.initState();
    readData();
  }

  void readData() async {
    country = await dataHandler.getStringValue(AppStrings.countryName);
    countryCode = await dataHandler.getStringValue(AppStrings.countryCode);

    lang = await dataHandler.getStringValue(AppStrings.langName);
    langCode = await dataHandler.getStringValue(AppStrings.langCode);

    setState(() {
      setCountry = country;
      setCountryCode = countryCode;

      setLang = lang;
      setLangCode = langCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: AppTextWidget(
            text: AppStrings.profile,
            fontSize: 18.0,
            color: AppColors.blackColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ProfileCardWidget(),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            ListTile(
              title: AppTextWidget(
                text: AppStrings.country,
                fontSize: 14.0,
                color: AppColors.blackColor.withOpacity(0.6),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: AppTextWidget(
                text: "${setCountry} (${setCountryCode})",
                fontSize: 20.0,
                color: AppColors.blackColor,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.normal,
              ),
            ),
            ListTile(
              title: AppTextWidget(
                text: AppStrings.language,
                fontSize: 14.0,
                color: AppColors.blackColor.withOpacity(0.6),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: AppTextWidget(
                text: "${setLang} (${setLangCode})",
                fontSize: 20.0,
                color: AppColors.blackColor,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Spacer(),
            const AppTextWidget(
              text: AppStrings.oneVersion,
              fontSize: 12.0,
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.normal,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButtonWidget(
                buttonColor: AppColors.errorColor.withOpacity(1),
                onPressed: () async {
                  // print('Button Pressed!');
                  await dataHandler.clearAllPreferences();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                  );
                },
                child: AppTextWidget(
                  text: AppStrings.wipeData,
                  fontSize: 18.0,
                  color: AppColors.whiteColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
