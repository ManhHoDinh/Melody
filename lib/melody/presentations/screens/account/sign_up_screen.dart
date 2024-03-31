import 'package:flutter/material.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/constants/dimension_constants.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/presentations/widgets/button_widget.dart';
import 'package:melody/melody/presentations/widgets/input_widget.dart';

import '../../../core/helper/AuthFunctions.dart';
import '../../../core/helper/assets_helper.dart';
import '../../../core/helper/image_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static final String routeName = 'sign_up_screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
            child: Form(
              key: formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      "Getting started",
                      style: TextStyles.h2.copyWith(
                          color: ColorPalette.blackText,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      "Create an account to continue!",
                      style:
                          TextStyles.h5.copyWith(color: ColorPalette.grayText),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: ImageHelper.loadFromAsset(AssetHelper.logo,
                        height: 150, width: 150),
                  ),
                  SizedBox(height: 20),
                  InputWidget(
                      controller: _nameController,
                      labelText: 'Name',
                      icon: AssetHelper.icoUser,
                      validator: (input) {
                        if (input?.isEmpty ?? true) {
                          return "Enter your name, please!";
                        }
                      }),
                  SizedBox(height: 20),
                  InputWidget(
                      controller: _emailController,
                      labelText: 'Email',
                      icon: AssetHelper.icoEmail,
                      validator: (input) {
                        final bool emailValid = RegExp(
                                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(input!);
                        if (input.isEmpty) {
                          return "Enter your email, please!";
                        } else if (!emailValid) {
                          return "Email is invalid!";
                        }
                      }),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (input) {
                      if (input == "") {
                        return "Enter your password, please!";
                      } else if (input != null && input.length <= 6) {
                        return "Password is too short!";
                      } else
                        return null;
                    },
                    obscureText: !_passwordVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: ColorPalette.bgTextFieldColor,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyles.h6.setColor(ColorPalette.grayText),
                      contentPadding: const EdgeInsets.only(bottom: 14),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Container(
                        child: Image.asset(AssetHelper.icoLock),
                        padding: const EdgeInsets.only(right: 20, left: 20),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input == "") {
                        return "Enter your password, please!";
                      } else if (input != null && input.length <= 6) {
                        return "Password is too short!";
                      } 
                      else if(_confirmPasswordController.text != _passwordController.text){
                        return "Password is not match!";
                      }
                      else
                        return null;
                      },
                    obscureText: !_confirmPasswordVisible,
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: ColorPalette.bgTextFieldColor,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                      ),
                      labelText: 'Confirm password',
                      labelStyle: TextStyles.h6.setColor(ColorPalette.grayText),
                      contentPadding: const EdgeInsets.only(bottom: 14),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Container(
                        child: Image.asset(AssetHelper.icoLock),
                        padding: const EdgeInsets.only(right: 20, left: 20),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 24,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    label: 'Sign Up',
                    color: ColorPalette.primaryColor,
                    textColor: Colors.white,
                    onTap: () async {
                      if (formSignInKey.currentState!.validate()) {}
                      await AuthServices.signUpUser(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          buildContext: context);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
