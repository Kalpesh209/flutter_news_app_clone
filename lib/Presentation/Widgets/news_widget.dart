import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_news_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_news_app_clone/AppUtils/author_function.dart';
import 'package:flutter_news_app_clone/AppUtils/date_functions.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/app_text_widget.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/news_webview_widget.dart';

class NewsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String publishDate;
  final String author;
  final String link;

  NewsWidget({
    required this.title,
    required this.subtitle,
    required this.publishDate,
    required this.author,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: title,
                  fontSize: 16.0,
                  color: Colors.black,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextWidget(
                          text: convertToRegularDateFormat(publishDate),
                          fontSize: 12.0,
                          color: AppColors.blackColor.withOpacity(0.5),
                          fontWeight: FontWeight.normal,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            AppTextWidget(
                              text: 'By ',
                              fontSize: 12.0,
                              color: AppColors.blackColor.withOpacity(0.5),
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AppTextWidget(
                              text: removeHttpsAndCom(author),
                              fontSize: 12.0,
                              color: AppColors.blackColor.withOpacity(1),
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 100, // Width of the oval button
                      height: 30, // Height of the oval button
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.7),
                        borderRadius:
                            BorderRadius.circular(25), // Half of the height
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsWebviewWidget(
                                newsURL: link,
                              ),
                            ),
                          );
                        },
                        child: AppTextWidget(
                          text: AppStrings.visit,
                          fontSize: 12.0,
                          color: Colors.black,
                          maxLines: 4,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
