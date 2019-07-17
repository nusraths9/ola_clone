import 'package:flutter/material.dart';

class TravelModesList extends StatefulWidget {
  @override
  State<TravelModesList> createState() => _TravelModesList();
}

class _TravelModesList extends State<TravelModesList> {

  List modeData = [
    {'modeName': 'Prime', 'modeTime': '9 min', 'modeIcon': 'ic_prime'},
    {'modeName': 'Mini', 'modeTime': '7 min', 'modeIcon': 'ic_mini'},
    {'modeName': 'Auto', 'modeTime': '1 min', 'modeIcon': 'ic_auto'},
    {'modeName': 'SUV', 'modeTime': '5 min', 'modeIcon': 'ic_suv'},
    {'modeName': 'Micro', 'modeTime': '11 min', 'modeIcon': 'ic_micro'},
    {'modeName': 'Rentals', 'modeTime': '3 min', 'modeIcon': 'ic_rentals'},
    {'modeName': 'Share', 'modeTime': '6 min', 'modeIcon': 'ic_share'},
  ];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: modeData.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () => _onSelected(index),
            child: Padding(
                padding: EdgeInsets.only(right: 30, left: index == 0 ? 15 : 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(modeData[index]['modeTime']),
                      Container(
                          decoration: new BoxDecoration(
                              color: _selectedIndex != null &&
                                      _selectedIndex == index
                                  ? Colors.lime[400]
                                  : null,
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(40.0))),
                          child: IconButton(
                            icon: Image.asset(
                                'lib/images/cars/category/${modeData[index]['modeIcon']}.png'),
                            color: Colors.black38,
                          )),
                      Text(modeData[index]['modeName'])
                    ]))));
  }
}
