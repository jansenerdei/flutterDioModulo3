import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListVewHorizontal extends StatefulWidget {
  const ListVewHorizontal({super.key});

  @override
  State<ListVewHorizontal> createState() => _ListVewHorizontalState();
}

class _ListVewHorizontalState extends State<ListVewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    elevation: 8,
                    child: Image.asset(AppImages.paisage1),
                  ),
                  Card(
                    elevation: 8,
                    child: Image.asset(AppImages.paisage2),
                  ),
                  Card(
                    elevation: 8,
                    child: Image.asset(AppImages.paisage3),
                  ),
                ],
              )),
          Expanded(flex: 3, child: Container())
        ],
      ),
    );
  }
}
