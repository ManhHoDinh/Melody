import 'package:flutter/material.dart';
import 'package:melody/melody/core/helper/image_helper.dart';
import 'package:melody/melody/core/helper/text_styles.dart';

import '../../core/constants/color_palatte.dart';

class InputWidget extends StatefulWidget {
  final String labelText;
  final String icon;
  final String? suffixIcon;
  final bool? isPassword;
  final TextInputType? type;
  final TextEditingController? controller;
  final String? Function(String? input)? validator;
  const InputWidget(
      {super.key,
      required this.labelText,
      required this.icon,
      this.suffixIcon,
      this.isPassword,
      this.controller,
      this.validator,
      this.type});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: isObscure,
      enableSuggestions: widget.isPassword ?? false,
      autocorrect: widget.isPassword ?? false,
      
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 14),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorPalette.bgTextFieldColor,
          ),
        ),
        prefixIcon: Container(
          child: ImageHelper.loadFromAsset(widget.icon, height: 20, width: 20),
          padding: const EdgeInsets.only(right: 20, left: 20),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 24,
        ),
        suffixIcon: Container(
          child: widget.suffixIcon != null
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Image.asset(widget.suffixIcon!)
              )
            : Image.asset(widget.icon,color: Colors.black,width: 20,height: 20, opacity: const AlwaysStoppedAnimation(0),),
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 24,
        ),
        label: Container(
          child: Text(
            widget.labelText,
            style: TextStyles.h6.setColor(ColorPalette.grayText),
          ),
        ),
      ),
      onTapOutside: (event) {},
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}