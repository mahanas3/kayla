import 'package:flutter/material.dart';
import 'package:kayla/custom_widget/custom_textfield.dart';
import 'package:kayla/custom_widget/customadd_button.dart';
import 'package:kayla/provider/home_provider.dart';
import 'package:kayla/utilities/dimensions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff01796F),
        title: Padding(
          padding: EdgeInsets.only(
              right: Dimensions.heightCalc(context, 10),
              left: Dimensions.heightCalc(context, 12)),
          child: CustomTextField(
            labelText: 'Search',
            hintText: 'Search',
            controller: searchController,
            icon: const Icon(Icons.search),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Dimensions.heightCalc(context, 13)),
            child: InkWell(
                onTap: () {
                  context.read<HomeProvider>().signOut(context);
                },
                child: const Icon(Icons.logout)),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: Dimensions.heightCalc(context, 20)),
            child: Row(
              children: [
                Text(
                  'Age Range:',
                  style:
                      TextStyle(fontSize: Dimensions.heightCalc(context, 15)),
                ),
                SizedBox(
                  width: Dimensions.widthCalc(context, 5),
                ),
                Text(
                  Provider.of<HomeProvider>(context)
                      .minValue
                      .toStringAsFixed(0),
                  style:
                      TextStyle(fontSize: Dimensions.heightCalc(context, 15)),
                ),
                const Text(' - '),
                Text(
                  Provider.of<HomeProvider>(context)
                      .maxValue
                      .toStringAsFixed(0),
                  style:
                      TextStyle(fontSize: Dimensions.heightCalc(context, 15)),
                ),
                SizedBox(
                  width: Dimensions.widthCalc(context, 14),
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: Dimensions.heightCalc(context, 2),
                  ),
                  child: RangeSlider(
                    values: RangeValues(
                      Provider.of<HomeProvider>(context)
                          .minValue
                          .clamp(0.0, 50.0),
                      Provider.of<HomeProvider>(context)
                          .maxValue
                          .clamp(0.0, 50.0),
                    ),
                    activeColor: const Color(0xff01796F),
                    divisions: 6,
                    min: 0.0,
                    max: 50.0,
                    onChanged: (RangeValues values) {
                      Provider.of<HomeProvider>(context, listen: false)
                          .setMinSliderValue(values.start);
                      Provider.of<HomeProvider>(context, listen: false)
                          .setMaxSliderValue(values.end);
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Dimensions.heightCalc(context, 20),
                left: Dimensions.heightCalc(context, 10),
                right: Dimensions.heightCalc(context, 10)),
            child: Stack(children: [
              Container(
                height: Dimensions.heightCalc(context, 70),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.heightCalc(context, 5)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimensions.heightCalc(context, 10),
                    left: Dimensions.heightCalc(context, 20)),
                child: Container(
                  height: Dimensions.heightCalc(context, 50),
                  width: Dimensions.widthCalc(context, 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        Dimensions.heightCalc(context, 30)),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-JXTGHFY17JKveGhEsuP2rz0qxFMoKb6eHg&usqp=CAU'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: Dimensions.heightCalc(context, 13)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.heightCalc(context, 90)),
                      child: Text(
                        '',

                        style: TextStyle(
                          fontSize: Dimensions.heightCalc(context, 17),
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.heightCalc(context, 3),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.heightCalc(context, 35)),
                      child: Text(
                        '',
                        style: TextStyle(
                          fontFamily: 'RobotoMedium',
                          fontSize: Dimensions.heightCalc(context, 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(top: Dimensions.heightCalc(context, 450)),
              child: Stack(children: [
                SizedBox(
                  height: Dimensions.heightCalc(context, 50),
                  width: Dimensions.widthCalc(context, 190),
                  child: CustomAddButton(
                    text: 'Add Student',
                    onPressed: () {
                      context.read<HomeProvider>().userDetails(context);
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 13, left: 20),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
