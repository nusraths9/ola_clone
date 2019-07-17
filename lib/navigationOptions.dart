import 'package:flutter/material.dart';

class NavigationOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigathionOptions();
}

class _NavigathionOptions extends State<NavigationOptions> {

  List optionsList = [
    {'name': 'Daily', 'color': Colors.blue},
    {'name': 'Rentals', 'color': Colors.blue},
    {'name': 'Outstation', 'color': Colors.blue}
  ];

  int selectedOptIndex = 0;

  _optionSelected(int optionIndex) {
    setState(() {
      selectedOptIndex = optionIndex;
     
      print('selectedOptIndex value is: $selectedOptIndex');
      optionsList[selectedOptIndex]['color'] = Colors.lime[400];
      print('selected Obj value $optionsList[selectedOptIndex]');
      }
    );
  }
@override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: optionsList.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () => _optionSelected(index),
            child: Padding(
                padding: EdgeInsets.only(right: 0, left: index == 0 ? 15 : 0),
                child: Row(
                    children: <Widget>[
                      Container(
                          decoration: new BoxDecoration(
                              color: selectedOptIndex != null &&
                                      selectedOptIndex == index
                                  ? Colors.lime[400]
                                  : null,
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(40.0))),
                          child: MaterialButton(
                            minWidth: 10.0,
                            child: Text(optionsList[index]['name'])
                          )),
                    ]))));
  }
}
