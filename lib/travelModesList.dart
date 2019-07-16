import 'package:flutter/material.dart';
import './travelMode.dart';

class TravelModesList extends StatelessWidget {
  bool isAnySelected = false;
  static bool isSelected = false;

  List<Widget> modes = [
        SizedBox( width: 15 ),
        TravelMode('A', Icons.android, 'abc', isSelected),
        SizedBox( width: 30 ),
        TravelMode('B', Icons.android, 'abc', isSelected),
        SizedBox( width: 30 ),
        TravelMode('C', Icons.android, 'abc', isSelected),
        SizedBox( width: 30 ),
        TravelMode('D', Icons.android, 'abc', isSelected),
        SizedBox( width: 30 ),
        TravelMode('E', Icons.android, 'abc', isSelected),
        SizedBox( width: 30 ),
        TravelMode('F', Icons.android, 'abc', isSelected),
        SizedBox( width: 30 ),
        TravelMode('G', Icons.android, 'abc', isSelected),
        SizedBox( width: 30 ),
        TravelMode('H', Icons.android, 'abc', isSelected),
        SizedBox( width: 30 ),
        TravelMode('I', Icons.android, 'abc', isSelected),
        SizedBox( width: 15 )
      ];

  callback(data) {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      children: this.modes,
    );
  }
}