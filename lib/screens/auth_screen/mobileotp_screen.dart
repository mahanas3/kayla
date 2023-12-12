import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kayla/custom_widget/customadd_button.dart';
import 'package:kayla/provider/auth_provider.dart';
import 'package:kayla/utilities/dimensions.dart';
import 'package:provider/provider.dart';

class MobileOtp extends StatefulWidget {
  const MobileOtp({super.key});

  @override
  State<MobileOtp> createState() => _MobileOtpState();
}

class _MobileOtpState extends State<MobileOtp> {

  final phoneNoController = TextEditingController();

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Dimensions.heightCalc(context, 360),
                left: Dimensions.heightCalc(context, 20),
                right: Dimensions.heightCalc(context, 20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.heightCalc(context, 30)),
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IntlPhoneField(
                  controller: phoneNoController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone number',
                    hintStyle: TextStyle(fontFamily: 'RobotoRegular'),
                    border: InputBorder.none,
                  ),
                  showCountryFlag: false,
                  initialCountryCode: 'IN',
                  onChanged: (phone) {},
                  disableLengthCheck: true,
                  showDropdownIcon: false,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.heightCalc(context, 20)),
              child: SizedBox(
                width: Dimensions.widthCalc(context, 100),
                height: Dimensions.heightCalc(context, 40),
                child: CustomAddButton(
                  text: 'Get OTP',
                  onPressed: () async{
                    await context.read<AuthenticationProvider>().mobileOtp(context, phoneNoController.text);
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        Dimensions.heightCalc(context, 300),
                        Dimensions.heightCalc(context, 300),
                        Dimensions.heightCalc(context, 60),
                        Dimensions.heightCalc(context, 100),
                      ),
                      items: [
                        PopupMenuItem<String>(
                          child: SizedBox(
                            height: Dimensions.heightCalc(context, 50),
                            width: Dimensions.widthCalc(context, 160),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.heightCalc(context, 10)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right:
                                          Dimensions.heightCalc(context, 75)),
                                  child: Text(
                                    'Enter OTP',
                                    style: TextStyle(
                                      fontFamily: 'RobotoRegular',
                                      fontSize:
                                          Dimensions.heightCalc(context, 16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            child: Padding(
                          padding: EdgeInsets.only(
                              bottom: Dimensions.heightCalc(context, 50)),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: otpController,
                            decoration: const InputDecoration(
                              labelText: '',
                              fillColor: Color(0xff01796F),
                            ),
                          ),
                        )),
                        PopupMenuItem(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: Dimensions.heightCalc(context, 20)),
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                color: Color(0xff01796F),
                                fontFamily: 'RobotoRegular',
                              ),
                            ),
                          ),
                        ))
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
