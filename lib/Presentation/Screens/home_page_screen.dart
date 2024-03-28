import 'package:flutter_news_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_news_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_news_app_clone/AppUtils/topics.dart';
import 'package:flutter_news_app_clone/Presentation/Screens/profile_screen.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/app_text_widget.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/capsule_widget.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/home_section_country.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/home_section_geo.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/home_section_tab.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed_plus/webfeed_plus.dart';
import 'package:flutter/material.dart';
import 'package:webfeed_plus/domain/rss_feed.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePageScreen> {
  int _selectedItemIndex = 0;
  String tabName = AppStrings.world;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            leading: Text(''),
            backgroundColor: AppColors.primaryColor,
            title: AppTextWidget(
              text: AppStrings.highLight,
              fontSize: 18.0,
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    color: AppColors.blackColor,
                  ))
            ],
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.98,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: topicList.length,
                  itemBuilder: (context, index) {
                    return CapsuleWidget(
                      name: topicList[index].value,
                      border: AppColors.primaryColor,
                      background: _selectedItemIndex == index
                          ? AppColors.primaryColor.withOpacity(0.8)
                          : Colors.white,
                      currentIndex: index,
                      onTapCallback: (String isTapped) {
                        setState(() {
                          tabName = isTapped;
                        });
                      },
                      onTapIndex: (int index) {
                        setState(() {
                          if (_selectedItemIndex == index) {
                            _selectedItemIndex = -1; // Deselect if tapped again
                          } else {
                            _selectedItemIndex = index;
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              HomeSectionTabWidget(
                topic: "$tabName",
              ),
              HomeSectionCountryWidget(),
              HomeSectionGeoWidget(),
            ],
          ))),
    );
  }
}
