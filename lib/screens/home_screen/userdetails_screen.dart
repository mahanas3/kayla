import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayla/custom_widget/custom_button.dart';
import 'package:kayla/custom_widget/customuserdetails_textfield.dart';
import 'package:kayla/utilities/dimensions.dart';
import 'package:provider/provider.dart';
import '../../provider/home_provider.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final ImagePicker _picker = ImagePicker();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      body: provider.loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Dimensions.heightCalc(context, 115)),
                        child: Text(
                          'Enter User Details!',
                          style: TextStyle(
                            fontSize: Dimensions.heightCalc(context, 20),
                            color: const Color(0xff01796F),
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.heightCalc(context, 55)),
                      child: Container(
                        height: Dimensions.heightCalc(context, 120),
                        clipBehavior: Clip.antiAlias,
                        width: Dimensions.widthCalc(context, 120),
                        decoration: BoxDecoration(
                          color: const Color(0xff01796F),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: PopupMenuButton<String>(
                          onSelected: (value) async {
                            if (value == 'camera') {
                              final XFile? imagex = await _picker.pickImage(
                                source: ImageSource.camera,
                                imageQuality: 50,
                              );

                              context
                                  .read<HomeProvider>()
                                  .setImage(File(imagex!.path));
                            } else if (value == 'gallery') {
                              final XFile? imagex = await _picker.pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 50,
                              );
                              context
                                  .read<HomeProvider>()
                                  .setImage(File(imagex!.path));
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                enabled: false,
                                child: SizedBox(
                                  height: Dimensions.heightCalc(context, 50),
                                  width: Dimensions.widthCalc(context, 160),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.heightCalc(
                                              context, 10)),
                                      child: Text(
                                        'Select image from',
                                        style: TextStyle(
                                          color: const Color(0xff01796F),
                                          fontFamily: 'RobotoRegular',
                                          fontSize: Dimensions.heightCalc(
                                              context, 16),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'camera',
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: Dimensions.heightCalc(context, 5),
                                    left: Dimensions.heightCalc(context, 10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.camera_fill,
                                        size:
                                            Dimensions.heightCalc(context, 20),
                                        color: const Color(0xff01796F),
                                      ),
                                      SizedBox(
                                        width:
                                            Dimensions.widthCalc(context, 15),
                                      ),
                                      const Text(
                                        'Camera',
                                        style: TextStyle(
                                            fontFamily: 'RobotoRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'gallery',
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: Dimensions.heightCalc(context, 5),
                                    left: Dimensions.heightCalc(context, 10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.photo,
                                        color: const Color(0xff01796F),
                                        size:
                                            Dimensions.heightCalc(context, 22),
                                      ),
                                      SizedBox(
                                        width:
                                            Dimensions.widthCalc(context, 15),
                                      ),
                                      const Text(
                                        'Gallery',
                                        style: TextStyle(
                                            fontFamily: 'RobotoRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ];
                          },
                          child: Consumer<HomeProvider>(
                              builder: (context, value, child) {
                            return value.image != null
                                ? Image.file(value.image!, fit: BoxFit.cover)
                                : Icon(
                                    Icons.add_photo_alternate_rounded,
                                    size: Dimensions.heightCalc(context, 40),
                                    color: Colors.white,
                                  );
                          }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.heightCalc(context, 65),
                        left: Dimensions.heightCalc(context, 25),
                        right: Dimensions.heightCalc(context, 25),
                      ),
                      child: CustomUserTextField(
                        labelText: 'Name',
                        hintText: 'Name',
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name should not be empty';
                          }
                          return null;
                        },

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.heightCalc(context, 20),
                        right: Dimensions.heightCalc(context, 25),
                        left: Dimensions.heightCalc(context, 25),
                      ),
                      child: CustomUserTextField(
                        labelText: 'Age',
                        hintText: 'Age',
                        controller: ageController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Age should note be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.heightCalc(context, 40),
                    ),
                    SizedBox(
                      height: Dimensions.heightCalc(context, 55),
                      width: Dimensions.widthCalc(context, 270),
                      child: CustomButton(
                        text: 'Save',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<HomeProvider>().save(context,
                                nameController.text, ageController.text);
                          }
                        },
                        color: const Color(0xff01796F),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Dimensions.heightCalc(context, 70),
                        left: Dimensions.heightCalc(context, 250),
                      ),
                      child: Container(
                        height: Dimensions.heightCalc(context, 60),
                        width: Dimensions.widthCalc(context, 60),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff01796F),
                        ),
                        child: InkWell(
                          onTap: () {
                            context.read<HomeProvider>().home(context);
                          },
                          child: const Icon(
                            CupertinoIcons.person_2_fill,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
