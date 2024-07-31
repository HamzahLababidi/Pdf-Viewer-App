import 'package:flutter/material.dart';
import 'package:pdf_viewer/app_colors.dart';
import 'package:pdf_viewer/app_style.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.height,
      required this.width,
      required this.textData,
      this.obsecure = false,
      required this.icon,
      required this.controller});
  final double height, width;
  final String textData;
  final bool? obsecure;
  final IconData icon;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            widget.textData,
            style: ralewayStyle.copyWith(
              fontSize: 12.0,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          height: 50.0,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.whiteColor,
          ),
          child: TextFormField(
            controller: widget.controller,
            style: ralewayStyle.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.blueDarkColor,
              fontSize: 12.0,
            ),
            obscureText: widget.obsecure!,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(widget.icon),
              ),
              contentPadding: const EdgeInsets.only(top: 16.0),
              hintText: 'Enter ${widget.textData}',
              hintStyle: ralewayStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.blueDarkColor.withOpacity(0.5),
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        SizedBox(height: widget.height * 0.014),
      ],
    );
  }
}
