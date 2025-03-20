import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileOptionWidget extends StatelessWidget {
  final IconData? icon;
  final String? svgPicture;
  final String title;
  final String? subtitle;
  final String message;
  final String? messageSubtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final TextStyle? messageStyle;
  final TextStyle? messageSubtitleStyle;
  final VoidCallback? onTap;
  final double? iconSize;
  final int? messageMaxLines;
  final List<InlineSpan>? childText;

  const TileOptionWidget({
    super.key,
    this.icon,
    this.svgPicture,
    required this.title,
    this.subtitle,
    required this.message,
    this.messageSubtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.messageStyle,
    this.messageSubtitleStyle,
    this.onTap,
    this.iconSize,
    this.messageMaxLines,
    this.childText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize ?? 20.r,
                ),

              if (svgPicture != null) SvgPicture.asset(svgPicture!),

              if (icon != null || svgPicture != null) 10.horizontalSpaceRadius,

              RichText(
                text: TextSpan(
                  text: title,
                  style: titleStyle ?? AppStyle.f16TextW500Black,
                  children: childText,
                ),
              ),

              // subtitle text
              if (subtitle != null)
                Text(
                  ' $subtitle',
                  style: subtitleStyle ?? AppStyle.f12TextW500Black,
                ),

              10.horizontalSpaceRadius,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 125.w),
                      child: Text(
                        message,
                        style: messageStyle ?? AppStyle.f14TextW500Black,
                        textAlign: TextAlign.end,
                        maxLines: messageMaxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (messageSubtitle != null)
                      Container(
                        constraints: BoxConstraints(maxWidth: 125.w),
                        child: Text(
                          messageSubtitle!,
                          textAlign: TextAlign.end,
                          style:
                              messageSubtitleStyle ?? AppStyle.f14TextW500Black,
                        ),
                      ),
                  ],
                ),
              ),

              if (onTap != null)
                const Icon(
                  Icons.chevron_right,
                  color: Colors.black54,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
