import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class TwoDScrollTestView extends StatefulWidget {
  const TwoDScrollTestView({Key? key}) : super(key: key);

  @override
  State<TwoDScrollTestView> createState() => _TwoDScrollTestViewState();
}

class _TwoDScrollTestViewState extends State<TwoDScrollTestView> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List<int>.generate(100, (index) => index + 1)
                  .map((e) => BigRow(index: e))
                  .toList(),
            )),
      ),
    );
  }
}

class BigRow extends StatelessWidget {
  final int index;

  const BigRow({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var blockWidth = 400.0;
    var blockHeight = 300.0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: blockWidth,
            height: blockHeight,
            color: Colors.indigo,
            child: Text(
              'Row $index',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            width: blockWidth,
            height: blockHeight,
            color: Colors.lime,
          ),
          Container(
            width: blockWidth,
            height: blockHeight,
            color: Colors.amber,
          ),
          Container(
            width: blockWidth,
            height: blockHeight,
            color: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
