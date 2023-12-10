import 'package:flutter/material.dart';
import 'package:kayla/custom_widget/custom_button.dart';
import 'package:kayla/provider/auth_provider.dart';
import 'package:kayla/provider/home_provider.dart';
import 'package:kayla/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import '../../custom_widget/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    final passwordController = TextEditingController();

    final _formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: Dimensions.heightCalc(context, 100)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Hello!',
                    style: TextStyle(
                        fontSize: Dimensions.heightCalc(context, 22),
                        color: const Color(0xff01796F),
                        fontFamily: 'Roboto')),
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: Dimensions.heightCalc(context, 22),
                    color: const Color(0xff01796F),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.heightCalc(context, 55),
                      left: Dimensions.heightCalc(context, 30),
                      right: Dimensions.heightCalc(context, 30)),
                  child: CustomTextField(
                    labelText: 'Email',
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.endsWith('@gmail.com')) {
                        return 'Please enter valid email';
                      }
                    },
                  ),
                ),
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Dimensions.heightCalc(context, 20),
                        left: Dimensions.heightCalc(context, 30),
                        right: Dimensions.heightCalc(context, 30)),
                    child: CustomTextField(
                      labelText: 'Password',
                      hintText: 'Password',
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.heightCalc(context, 165)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            fontSize: Dimensions.heightCalc(context, 15),
                            color: const Color(0xff01796F),
                            fontFamily: 'RobotoMedium'),
                      )),
                ),
                SizedBox(
                  height: Dimensions.heightCalc(context, 30),
                ),
                SizedBox(
                    height: Dimensions.heightCalc(context, 55),
                    width: Dimensions.widthCalc(context, 270),
                    child: CustomButton(
                        text: 'Sign in',
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            context.read<HomeProvider>().home(context);
                          }
                        })),
                Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.heightCalc(context, 16),
                      left: Dimensions.heightCalc(context, 65)),
                  child: Row(
                    children: [
                      Text(
                        'Don`t have an account?',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: Dimensions.heightCalc(context, 15),
                            fontFamily: 'RobotoMedium'),
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<AuthProvider>().signUp(context);
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: Dimensions.heightCalc(context, 19),
                                color: const Color(0xff01796F)),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: Dimensions.heightCalc(context, 30)),
                  child: Divider(
                    color: const Color(0xfFD3D3D3),
                    height: Dimensions.heightCalc(context, 25),
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.heightCalc(context, 90),
                      top: Dimensions.heightCalc(context, 20)),
                  child: Row(
                    children: [
                      Container(
                        height: Dimensions.heightCalc(context, 65),
                        width: Dimensions.widthCalc(context, 65),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/google.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.widthCalc(context, 60),
                      ),
                      Container(
                        height: Dimensions.heightCalc(context, 35),
                        width: Dimensions.widthCalc(context, 35),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/mobile.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}