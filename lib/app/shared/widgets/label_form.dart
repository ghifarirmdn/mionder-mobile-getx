import 'package:flutter/material.dart';
import 'package:mionder_mobile_get/app/shared/import/main_import.dart';

class LabelForm extends StatelessWidget {
  final String? text;
  const LabelForm({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Text(
        '$text',
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: primaryColor),
      ),
    );
  }
}
