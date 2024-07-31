import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pdf_viewer/app_colors.dart';
import 'package:pdf_viewer/app_icons.dart';
import 'package:pdf_viewer/app_style.dart';
import 'package:pdf_viewer/responsive_widget.dart';
import 'package:pdf_viewer/screens/login_screen.dart';
import 'package:pdf_viewer/widgets/sign_textfield.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();

  bool isNotValid = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: AppColors.mainBlueColor,
                      child: Center(
                        child: Text(
                          'Viewti',
                          style: ralewayStyle.copyWith(
                            fontSize: 48.0,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(horizontal: ResponsiveWidget.isSmallScreen(context) ? height * 0.032 : height * 0.12),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Let’s',
                                style: ralewayStyle.copyWith(
                                  fontSize: 25.0,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Sign In 👇',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.blueDarkColor,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      CustomTextField(
                        height: height,
                        width: width,
                        textData: "First Name",
                        icon: Icons.person,
                        controller: fNameController,
                      ),
                      CustomTextField(
                          height: height, width: width, textData: "Last Name", icon: Icons.family_restroom, controller: lNameController),
                      CustomTextField(
                          height: height, width: width, textData: "Email", icon: AppIcons.emailIcon, controller: emailController),
                      CustomTextField(
                          height: height,
                          width: width,
                          textData: "Password",
                          obsecure: true,
                          icon: AppIcons.lockIcon,
                          controller: passwordController),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            'Already Have An Account?',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.mainBlueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            registerUser();
                          },
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AppColors.mainBlueColor,
                            ),
                            child: Text(
                              'Sign Up',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void registerUser() async {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        fNameController.text.isNotEmpty &&
        lNameController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text,
        "first_name": fNameController.text,
        "last_name": lNameController.text,
      };

      var response = await http.post(
        Uri.parse('http://localhost:3000/registration'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        if (mounted) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
        }
      }
      if (mounted) {
        const snackBar = SnackBar(
          content: Text('Registered Successfully!'),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      if (mounted) {
        const snackBar = SnackBar(
          content: Text('Registration Failed :('),
          duration: Duration(seconds: 3),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      setState(() {
        isNotValid = true;
      });
    }
  }
}
