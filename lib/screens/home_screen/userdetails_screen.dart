import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayla/custom_widget/customadd_button.dart';
import 'package:kayla/utilities/dimensions.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(top: Dimensions.heightCalc(context, 100)),
              child: Text(
                'Enter User Details!',
                style: TextStyle(
                    fontSize: Dimensions.heightCalc(context, 20),
                    color: const Color(0xff01796F),
                    fontFamily: 'Roboto'),
              ),
            ),
          ),
          Container(
            height: Dimensions.heightCalc(context, 80),
            width: Dimensions.widthCalc(context, 80),
            decoration: BoxDecoration(
                color: const Color(0xff01796F),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                borderRadius:
                    BorderRadius.circular(Dimensions.heightCalc(context, 20))),
            child: Icon(Icons.add_photo_alternate_rounded,
                size: Dimensions.heightCalc(context, 20)),
          ),
          SizedBox(
              height: Dimensions.heightCalc(context, 55),
              width: Dimensions.widthCalc(context, 270),
              child: CustomAddButton(text: 'Save', onPressed: () {})),
          Container(
            width: Dimensions.widthCalc(context, 40),
            height: Dimensions.heightCalc(context, 50),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xff01796F)),
            child: const Icon(CupertinoIcons.person_2_fill),
          )
        ],
      ),
    );
  }
}
