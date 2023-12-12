import 'package:flutter/material.dart';
import 'package:kayla/utilities/dimensions.dart';

class Google extends StatefulWidget {
  const Google({super.key});

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Dimensions.widthCalc(context, 100),
              height: Dimensions.heightCalc(context, 80),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQymUrbs2H6p32KIMGMRHdLVGRxuLrkUSgJEPbdKnnIBURsnmwezznm6gqXO8nzGm5efO0&usqp=CAU'),
                      fit: BoxFit.fill)),
            ),
          )
        ],
      ),
    );
  }
}
