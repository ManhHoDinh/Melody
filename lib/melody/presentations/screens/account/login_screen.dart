import 'package:flutter/material.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/constants/dimension_constants.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/presentations/screens/account/sign_up_screen.dart';
import 'package:melody/melody/presentations/widgets/button_widget.dart';
import 'package:melody/melody/presentations/widgets/input_widget.dart';

import '../../../core/helper/AuthFunctions.dart';
import '../../../core/helper/assets_helper.dart';
import '../../../core/helper/image_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static final String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  final formSignInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Form(
              key: formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: ImageHelper.loadFromAsset(AssetHelper.logo,
                        height: 150, width: 150),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Login to continue",
                      style: TextStyles.h2.copyWith(
                          color: ColorPalette.blackText,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  InputWidget(
                      controller: _emailController,
                      labelText: 'Email',
                      icon: AssetHelper.icoUser,
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
                  SizedBox(
                    height: 30,
                  ),
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
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot password?",
                          textAlign: TextAlign.right,
                          style: TextStyles.h5
                              .copyWith(color: ColorPalette.primaryColor)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: kDefaultBorderRadius,
                    onTap: () async {
                      await AuthServices.siginWithGoogle(context);
                    },
                    splashColor: Colors.blueAccent,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: kDefaultBorderRadius,
                          border: Border.all(color: Colors.black)),
                      padding:
                          const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Row(
                        children: [
                          Container(
                            child: ImageHelper.loadFromAsset(
                                AssetHelper.icoGoogle,
                                height: 24,
                                width: 24),
                            padding: const EdgeInsets.only(right: 30, left: 30),
                          ),
                          Text(
                            "Login with Google",
                            style: TextStyles.h5.copyWith(
                                color: ColorPalette.blackText,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    label: 'Login',
                    color: ColorPalette.primaryColor,
                    textColor: Colors.white,
                    onTap: () async {
                      if (formSignInKey.currentState!.validate()) {}
                      await AuthServices.signinUser(_emailController.text,
                          _passwordController.text, context);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Are you new user?",
                        style: TextStyles.h6.setColor(ColorPalette.grayText),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName);
                          },
                          child: Text("Sign up",
                              style: TextStyles.h6
                                  .setColor(ColorPalette.grayText)))
                    ],
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
