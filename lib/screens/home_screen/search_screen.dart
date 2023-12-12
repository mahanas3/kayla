import 'package:flutter/material.dart';
import 'package:kayla/utilities/dimensions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Stack(children: [
                Container(
                  height: Dimensions.heightCalc(context, 70),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        Dimensions.heightCalc(context, 5)),
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
                          '',
                        ),
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
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '',
                            style: TextStyle(
                              fontSize: Dimensions.heightCalc(context, 17),
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.heightCalc(context, 3),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.heightCalc(context, 90)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '',
                            style: TextStyle(
                              fontFamily: 'RobotoMedium',
                              fontSize: Dimensions.heightCalc(context, 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: Dimensions.heightCalc(context, 15),
              );
            },
            itemCount: 0,
          )
        ],
      ),
    );
  }
}
