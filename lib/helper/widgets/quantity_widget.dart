import 'package:delivery_food/constants/app_color.dart';
import 'package:delivery_food/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityWidget extends StatelessWidget {
  final int quantity;
  final Function()? onIncrement;
  final Function()? onDecrement;
  const QuantityWidget({
    super.key,
    required this.quantity,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (quantity > 0) ...[
          Visibility(
            visible: onDecrement != null,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                onTap: onDecrement,
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                      width: 2.r,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 20.r,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
        if (quantity > 0) ...[
          Container(
            constraints: BoxConstraints(minWidth: 30.r),
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.center,
              style: AppStyle.f12TextW500Black.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        Visibility(
          visible: onIncrement != null,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(4),
            child: InkWell(
              onTap: onIncrement,
              child: Ink(
                padding: EdgeInsets.all(2.r),
                color: AppColor.primaryColor,
                child: Icon(
                  Icons.add,
                  size: 20.r,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
