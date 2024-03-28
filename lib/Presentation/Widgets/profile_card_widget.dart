import 'package:flutter/material.dart';
import 'package:flutter_news_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_news_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_news_app_clone/AppUtils/gender_function.dart';
import 'package:flutter_news_app_clone/AppUtils/shared_pref_data_handler.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/app_text_widget.dart';

class ProfileCardWidget extends StatefulWidget {
  const ProfileCardWidget({super.key});

  @override
  State<ProfileCardWidget> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCardWidget> {
  SharedPreferenceDataHandler dataHandler = SharedPreferenceDataHandler();

  String name = "";
  String setName = "";

  String gender = "";
  String setGender = "";

  @override
  initState() {
    super.initState();
    readData();
  }

  void readData() async {
    name = await dataHandler.getStringValue(AppStrings.userName);
    gender = await dataHandler.getStringValue(AppStrings.genderValue);

    setState(() {
      setName = name;
      setGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  getGenderURL(setGender)), // Replace this with your image URL
            ),
            const SizedBox(height: 16),
            AppTextWidget(
              text: setName,
              fontSize: 24.0,
              color: AppColors.blackColor,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
            ),
            // SizedBox(height: 8),
            const AppTextWidget(
              text: AppStrings.user,
              fontSize: 12.0,
              color: AppColors.blackColor,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
