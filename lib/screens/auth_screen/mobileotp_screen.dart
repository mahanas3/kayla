import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:kayla/custom_widget/custom_button.dart';
import 'package:kayla/custom_widget/customadd_button.dart';
import 'package:kayla/custom_widget/custommobile_textfield.dart';
import 'package:kayla/utilities/dimensions.dart';

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
              child: CustomOtpTextField(
                labelText: 'Enter your phone number',
                hintText: 'Enter your phone number',
                controller: phoneNoController,
                keyBoard: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.heightCalc(context, 20)),
              child: SizedBox(
                width: Dimensions.widthCalc(context, 100),
                height: Dimensions.heightCalc(context, 40),
                child: CustomAddButton(
                  text: 'Get OTP',
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: const RelativeRect.fromLTRB(
                        300.0,
                        300.0,
                        60.0,
                        100.0,
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
            const CountryCodePicker(
              initialSelection: 'IT',
              favorite: ['+91', 'IN'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            )
          ],
        ),
      ),
    );
  }
}
