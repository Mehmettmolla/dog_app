import 'package:flutter/material.dart';

class CustomMultiLineTextfield extends StatelessWidget {
  const CustomMultiLineTextfield({super.key, this.maxLines, this.hintText, this.onChanged, this.controller, this.onSubmitted});
  final int? maxLines;
  final String? hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onChanged,
      autofocus: true,
      onChanged:  onChanged,
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
