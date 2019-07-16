import 'package:flutter/material.dart';

class TravelMode extends StatefulWidget {
  final String modeName;
  final IconData modeIcon;
  final String modeTime;
  bool isSelected = false;

  TravelMode(this.modeName, this.modeIcon, this.modeTime, this.isSelected);

  @override
  State<TravelMode> createState() => _TravelMode();
}

class _TravelMode extends State<TravelMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(widget.modeTime),
          Container(
            decoration: new BoxDecoration(
                color: widget.isSelected ? Colors.blue : null,
                borderRadius: new BorderRadius.all(const Radius.circular(40.0))),
            child: IconButton(
              icon: Icon(widget.modeIcon),
              color: Colors.black38,
              onPressed: () {
                setState(() {
                  widget.isSelected = !widget.isSelected;
                });
              },
            ),
          ),
          Text(widget.modeName)
        ],
      ),
    );
  }
}