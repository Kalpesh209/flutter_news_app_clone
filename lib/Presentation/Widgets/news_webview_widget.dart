import 'package:flutter/material.dart';
import 'package:flutter_news_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_news_app_clone/AppUtils/app_strings.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/app_text_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebviewWidget extends StatefulWidget {
  final String newsURL;
  const NewsWebviewWidget({
    super.key,
    required this.newsURL,
  });

  @override
  State<NewsWebviewWidget> createState() => _NewsWebviewAppState();
}

class _NewsWebviewAppState extends State<NewsWebviewWidget> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.newsURL),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
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
          text: AppStrings.highLight,
          fontSize: 18.0,
          color: AppColors.blackColor,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
