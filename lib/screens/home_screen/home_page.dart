import 'package:flutter/material.dart';
import 'package:kayla/custom_widget/custom_textfield.dart';
import 'package:kayla/custom_widget/customadd_button.dart';
import 'package:kayla/provider/home_provider.dart';
import 'package:kayla/utilities/dimensions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Retrieve name and age from route arguments
    final Map<String, dynamic>? arguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String? name = arguments?['name'];
    final String? age = arguments?['age'];

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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: Dimensions.heightCalc(context, 20)),
              child: Row(
                children: [
                  Text(
                    'Age Range:',
                    style: TextStyle(fontSize: Dimensions.heightCalc(context, 15)),
                  ),
                  SizedBox(
                    width: Dimensions.widthCalc(context, 5),
                  ),
                  Text(
                    Provider.of<HomeProvider>(context)
                        .minValue
                        .toStringAsFixed(0),
                    style: TextStyle(fontSize: Dimensions.heightCalc(context, 15)),
                  ),
                  const Text(' - '),
                  Text(
                    Provider.of<HomeProvider>(context)
                        .maxValue
                        .toStringAsFixed(0),
                    style: TextStyle(fontSize: Dimensions.heightCalc(context, 15)),
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

            // Display the name and age
            if (name != null && age != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Name: $name, Age: $age',
                  style: TextStyle(fontSize: 18),
                ),
              ),

            // Add your other widgets here...

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: Dimensions.heightCalc(context, 450)),
                child: Stack(children: [
                  SizedBox(
                    height: Dimensions.heightCalc(context, 50),
                    width: Dimensions.widthCalc(context, 190),
                    child: CustomAddButton(
                        text: 'Add Student',
                        onPressed: () {
                          context.read<HomeProvider>().userDetails(context);
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 13, left: 20),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
