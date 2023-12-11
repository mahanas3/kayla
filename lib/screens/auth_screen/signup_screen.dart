import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_textfield.dart';
import '../../provider/auth_provider.dart';
import '../../provider/home_provider.dart';
import '../../utilities/dimensions.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController1 = TextEditingController();

  final passwordController1 = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthentificationProvider>(
        builder: (BuildContext context, AuthentificationProvider value, Widget? child) {
          return value.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff01796F),
                  ),
                )
              : SingleChildScrollView(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.heightCalc(context, 100)),
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
                          Form(
                            key: formKey,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: Dimensions.heightCalc(context, 55),
                                  left: Dimensions.heightCalc(context, 30),
                                  right: Dimensions.heightCalc(context, 30)),
                              child: CustomTextField(
                                labelText: 'Email',
                                hintText: 'Email',
                                controller: emailController1,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.endsWith('@gmail.com')) {
                                    return 'Please enter valid email';
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.heightCalc(context, 20),
                                left: Dimensions.heightCalc(context, 30),
                                right: Dimensions.heightCalc(context, 30)),
                            child: CustomTextField(
                              labelText: 'Password',
                              hintText: 'Password',
                              controller: passwordController1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid password!';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightCalc(context, 30),
                          ),
                          SizedBox(
                              height: Dimensions.heightCalc(context, 55),
                              width: Dimensions.widthCalc(context, 270),
                              child: CustomButton(
                                  text: 'Sign Up',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<AuthentificationProvider>().signUp(
                                          context: context,
                                          email: emailController1.text,
                                          password: passwordController1.text);
                                    }
                                  }, color: Colors.blue,)),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.heightCalc(context, 16),
                                left: Dimensions.heightCalc(context, 65)),
                            child: Row(
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          Dimensions.heightCalc(context, 15),
                                      fontFamily: 'RobotoMedium'),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signIn');
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                          fontSize: Dimensions.heightCalc(
                                              context, 19),
                                          color: const Color(0xff01796F)),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Dimensions.heightCalc(context, 30)),
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
                                        image: AssetImage(
                                            'assets/images/google.png'),
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
                                        image: AssetImage(
                                            'assets/images/mobile.png'),
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
              );
        },
      ),
    );
  }
}
