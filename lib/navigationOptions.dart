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

  // String selectedOptionName = '';
  // Object selectedOptObj;
  int selectedOptIndex = 0;

  _optionSelected(int optionIndex) {
    setState(() {
      selectedOptIndex = optionIndex;
      // print('selectedOptionName value is $selectedOptionName');
      // selectedOptObj = optionsList.where((opt) => opt['name'] == optionName);
      // print('selectedOptObj value is $selectedOptObj');
      // selectedOptIndex = optionsList.indexOf(selectedOptObj);
      print('selectedOptIndex value is: $selectedOptIndex');
      optionsList[selectedOptIndex]['color'] = Colors.lime[400];
      print('selected Obj value $optionsList');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: optionsList.map((opt) {
        int index = optionsList.indexOf(opt);
        print('Finding Index value in map: $index');
        print("Vale of color $opt");
        return GestureDetector(
          child: Option(opt['name'], opt['color']),
          onTap: _optionSelected(index),
        );
      }).toList()
      // <Widget>[
      //   GestureDetector(
      //     child: Option('Daily', color),
      //     onTap: _optionSelected('Daily'),
      //   ),
      //   Option('Daily', color),
      //   Option('Rentals', color),
      //   Option('Outstation', color)
      // ],
    );
  }
}

class Option extends StatelessWidget {
  final name;
  final color;

  Option(this.name, this.color);
  @override
    Widget build(BuildContext context) {
      return Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(const Radius.circular(50.0))),
          child: MaterialButton(
            // onPressed: _optionSelected(index),
              minWidth: 10.0,
              child: Text(name))
        );
    }
}