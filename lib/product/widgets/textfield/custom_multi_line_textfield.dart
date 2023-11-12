import 'package:flutter/material.dart';

class CustomMultiLineTextfield extends StatelessWidget {
  const CustomMultiLineTextfield({super.key, this.maxLines, this.hintText});
  final int? maxLines;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      textInputAction: TextInputAction.search,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
