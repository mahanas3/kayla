import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_textfield.dart';
import '../../provider/auth_provider.dart';
import '../../routes/route_name.dart';
import '../../utilities/dimensions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<AuthentificationProvider>(
        builder: (BuildContext context, AuthentificationProvider value,
            Widget? child) {
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Text('Hello!',
                                style: TextStyle(
                                    fontSize:
                                        Dimensions.heightCalc(context, 22),
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
                            Padding(
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
                                  } else if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
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
                                        fontSize:
                                            Dimensions.heightCalc(context, 15),
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
                                  text: 'Sign In',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      context
                                          .read<AuthentificationProvider>()
                                          .login(
                                              context: context,
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                    }
                                  },
                                  color: const Color(0xff01796F),
                                )),
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
                                        fontSize:
                                            Dimensions.heightCalc(context, 14),
                                        fontFamily: 'RobotoMedium'),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, RouteName.signup);
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontSize: Dimensions.heightCalc(
                                                context, 17),
                                            color: const Color(0xff01796F),
                                            fontFamily: 'Roboto'),
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
                                  InkWell(
                                    onTap: () {
                                      showMenu(
                                        context: context,
                                        position: RelativeRect.fromLTRB(
                                          Dimensions.heightCalc(context, 300),
                                          Dimensions.heightCalc(context, 300),
                                          Dimensions.heightCalc(context, 40),
                                          Dimensions.heightCalc(context, 100),
                                        ),
                                        items: [
                                          PopupMenuItem<String>(
                                            child: Center(
                                                child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: Dimensions.heightCalc(
                                                      context, 20)),
                                              child: Container(
                                                height: Dimensions.heightCalc(
                                                    context, 70),
                                                width: Dimensions.widthCalc(
                                                    context, 70),
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQymUrbs2H6p32KIMGMRHdLVGRxuLrkUSgJEPbdKnnIBURsnmwezznm6gqXO8nzGm5efO0&usqp=CAU'),
                                                        fit: BoxFit.fill)),
                                              ),
                                            )),
                                          ),
                                          PopupMenuItem<String>(
                                            child: Center(
                                              child: Text(
                                                'Choose an account',
                                                style: TextStyle(
                                                  fontFamily: 'RobotoRegular',
                                                  fontSize:
                                                      Dimensions.heightCalc(
                                                          context, 25),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                              child: Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: Dimensions.heightCalc(
                                                      context, 20)),
                                              child: Text(
                                                'to continue to Mahanas',
                                                style: TextStyle(
                                                    fontFamily: 'RobotoRegular',
                                                    fontSize:
                                                        Dimensions.heightCalc(
                                                            context, 15)),
                                              ),
                                            ),
                                          )),
                                        ],
                                      );
                                    },
                                    child: Container(
                                      height:
                                          Dimensions.heightCalc(context, 65),
                                      width: Dimensions.widthCalc(context, 65),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/google.png'),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.widthCalc(context, 60),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<AuthentificationProvider>()
                                          .phone(context);
                                    },
                                    child: Container(
                                      height:
                                          Dimensions.heightCalc(context, 35),
                                      width: Dimensions.widthCalc(context, 35),
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/images/mobile.png'),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
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
        },
      ),
    );
  }
}
