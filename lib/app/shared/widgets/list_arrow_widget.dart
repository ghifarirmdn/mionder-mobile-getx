import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/shared/styles/app_images.dart';

class MyListArrowWidget extends StatelessWidget {
  const MyListArrowWidget({
    super.key,
    this.prefixIcon,
    this.label,
    this.onTap,
    this.prefixIconColor,
  });
  final String? prefixIcon;
  final String? label;
  final Function()? onTap;
  final Color? prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              AppImage.svg(
                prefixIcon ?? 'ic-error',
                width: 30,
                color: prefixIconColor ?? Colors.black54,
              ),
              const SizedBox(width: 10),
              Text(
                label ?? 'No Label',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          AppImage.svg(
            'ic-arrow-right',
            width: 30,
          )
        ],
      ),
    );
  }
}
