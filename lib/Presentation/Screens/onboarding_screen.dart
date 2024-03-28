import 'package:flutter/material.dart';
import 'package:flutter_news_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_news_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_news_app_clone/AppUtils/country_codes.dart';
import 'package:flutter_news_app_clone/AppUtils/languages.dart';
import 'package:flutter_news_app_clone/AppUtils/shared_pref_data_handler.dart';
import 'package:flutter_news_app_clone/Presentation/Screens/home_page_screen.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/app_text_widget.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/text_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  SharedPreferenceDataHandler dataHandler = SharedPreferenceDataHandler();

  String name = '';
  CountryCodes? selectedCountry;
  Language? selectedLanguage;

  String? gender;
  final List<String> genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading: const Text(""),
          backgroundColor: AppColors.primaryColor,
          title: AppTextWidget(
            text: AppStrings.onBoarding,
            fontSize: 18.0,
            color: AppColors.blackColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: AppStrings.name,
                  labelStyle: TextStyle(color: AppColors.blackColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blackColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  AppTextWidget(
                    text: AppStrings.gender,
                    fontSize: 12.0,
                    color: AppColors.blackColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(color: AppColors.blackColor.withOpacity(0.7)),
                  color: AppColors.whiteColor,
                ),
                child: DropdownButton<String>(
                  value: gender,
                  items: genders.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: AppTextWidget(
                        text: value,
                        fontSize: 18.0,
                        color: AppColors.blackColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  underline: Container(),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.blackColor,
                  ),
                  elevation: 8,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  AppTextWidget(
                    text: AppStrings.country,
                    fontSize: 12.0,
                    color: AppColors.blackColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(color: AppColors.blackColor.withOpacity(0.7)),
                  color: Colors.white, // Background color
                ),
                child: DropdownButton<CountryCodes>(
                  value: selectedCountry,
                  items: countries.map((CountryCodes country) {
                    return DropdownMenuItem<CountryCodes>(
                      value: country,
                      child: AppTextWidget(
                        text: country.name,
                        fontSize: 16.0,
                        color: AppColors.blackColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (CountryCodes? newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                    });
                  },
                  underline: Container(),
                  icon: const Icon(Icons.arrow_drop_down,
                      color: AppColors.blackColor),
                  elevation: 8,
                  isExpanded: true,
                  dropdownColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  AppTextWidget(
                    text: AppStrings.language,
                    fontSize: 12.0,
                    color: AppColors.blackColor,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(color: AppColors.blackColor.withOpacity(0.7)),
                  color: Colors.white, // Background color
                ),
                child: DropdownButton<Language>(
                  value: selectedLanguage,
                  items: languages.map((Language language) {
                    return DropdownMenuItem<Language>(
                      value: language,
                      child: AppTextWidget(
                        text: language.name,
                        fontSize: 16.0,
                        color: AppColors.blackColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  onChanged: (Language? newValue) {
                    setState(() {
                      selectedLanguage = newValue!;
                    });
                  },
                  underline: Container(), // Hides the underline
                  icon: const Icon(Icons.arrow_drop_down,
                      color: AppColors.blackColor), // Custom dropdown icon
                  elevation: 8, // Dropdown elevation
                  isExpanded:
                      true, // Ensures the dropdown button expands to fill the container horizontally
                  dropdownColor: Colors.white, // Dropdown background color
                ),
              ),
              const Spacer(),
              const SizedBox(height: 20),
              TextButtonWidget(
                buttonColor: AppColors.primaryColor.withOpacity(1),
                onPressed: () async {
                  // print('Button Pressed!');
                  // print(name);
                  // print(gender);
                  // print(selectedCountry!.name.toString());
                  // print(selectedLanguage!.name.toString());
                  // print(selectedLanguage!.code.toString());

                  await dataHandler.setStringValue(AppStrings.userName, name);
                  await dataHandler.setStringValue(
                    AppStrings.genderValue,
                    gender.toString(),
                  );
                  await dataHandler.setStringValue(
                    AppStrings.countryCode,
                    selectedCountry!.code.toString(),
                  );
                  await dataHandler.setStringValue(
                    AppStrings.countryName,
                    selectedCountry!.name.toString(),
                  );

                  await dataHandler.setStringValue(
                    AppStrings.langCode,
                    selectedLanguage!.code.toString(),
                  );
                  await dataHandler.setStringValue(
                    AppStrings.langName,
                    selectedLanguage!.name.toString(),
                  );
                  await dataHandler.setStringValue(
                    AppStrings.doneOnboarding,
                    AppStrings.yes,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomePageScreen()),
                  );
                },
                child: AppTextWidget(
                  text: AppStrings.submitData,
                  fontSize: 18.0,
                  color: AppColors.blackColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
