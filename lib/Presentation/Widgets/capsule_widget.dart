import 'package:flutter/material.dart';
import 'package:flutter_news_app_clone/AppUtils/app_colors.dart';
import 'package:flutter_news_app_clone/Presentation/Widgets/app_text_widget.dart';

class CapsuleWidget extends StatefulWidget {
  final String name;
  final Color border;
  final Color background;
  final Function(String)? onTapCallback;
  final int currentIndex;
  final ValueChanged<int>? onTapIndex;
  const CapsuleWidget({
    Key? key,
    required this.name,
    required this.border,
    required this.background,
    required this.currentIndex,
    this.onTapCallback,
    this.onTapIndex,
  }) : super(key: key);

  @override
  State<CapsuleWidget> createState() => _CapsuleWidgetState();
}

class _CapsuleWidgetState extends State<CapsuleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: GestureDetector(
        onTap: () {
          if (widget.currentIndex != null && widget.onTapIndex != null) {
            widget.onTapIndex!(widget.currentIndex);
          }
          widget.onTapCallback!(widget.name);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: widget.background,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: widget.border, // Border color
              width: 1, // Border width
            ),
          ),
          child: Center(
            child: AppTextWidget(
              text: widget.name,
              fontSize: 16.0,
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
