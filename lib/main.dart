import 'dart:async';

import 'package:flutter/material.dart';

import 'package:search_map_place/search_map_place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './travelModesList.dart';

String apiKEY;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Map Place Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _mapController = Completer();

  static CameraPosition _initialCamera = CameraPosition(
    target: LatLng(-20.3000, -40.2990),
    zoom: 14.0000,
  );
  static bool colourChange = false;
  static bool colourChangeDaily = false;
  static bool colourChangeRentals = false;
  static bool colourChangeOutStation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: MaterialButton(
                              child: Icon(
                                Icons.menu,
                                color: Colors.black54,
                                size: 30,
                              ),
                              onPressed: () {}),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                decoration: new BoxDecoration(
                                    color: colourChangeDaily
                                        ? Colors.lime[400]
                                        : null,
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(50.0))),
                                child: MaterialButton(
                                    minWidth: 10.0,
                                    child: Text(
                                      "Daily",
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        colourChangeDaily = !colourChangeDaily;
                                        colourChangeRentals = false;
                                        colourChangeOutStation = false;
                                      });
                                    }),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                    color: colourChangeRentals
                                        ? Colors.lime[400]
                                        : null,
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(40.0))),
                                child: MaterialButton(
                                    minWidth: 10.0,
                                    child: Text(
                                      "Rentals",
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        colourChangeDaily = false;
                                        colourChangeRentals =
                                            !colourChangeRentals;
                                        colourChangeOutStation = false;
                                      });
                                    }),
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                    color: colourChangeOutStation
                                        ? Colors.lime[400]
                                        : null,
                                    borderRadius: new BorderRadius.all(
                                        const Radius.circular(40.0))),
                                child: MaterialButton(
                                    minWidth: 10.0,
                                    child: Text(
                                      "Outstation",
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        colourChangeDaily = false;
                                        colourChangeRentals = false;
                                        colourChangeOutStation =
                                            !colourChangeOutStation;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: MaterialButton(
                              child: Icon(
                                Icons.notifications,
                                color: Colors.black54,
                                size: 30,
                              ),
                              onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: _initialCamera,
                        onMapCreated: (GoogleMapController controller) {
                          _mapController.complete(controller);
                        },
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.05,
                        child: SearchMapPlaceWidget(
                          apiKey: "AIzaSyBs-GD592vbBelggL9Dhmlf04rzAOpf5PM",
                          location: _initialCamera.target,
                          radius: 30000,
                          onSelected: (place) async {
                            final geolocation = await place.geolocation;

                            final GoogleMapController controller =
                                await _mapController.future;

                            controller.animateCamera(CameraUpdate.newLatLng(
                                geolocation.coordinates));
                            controller.animateCamera(
                                CameraUpdate.newLatLngBounds(
                                    geolocation.bounds, 0));
                          },
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.5,
                        right: MediaQuery.of(context).size.width * 0.05,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () async {
                            final GoogleMapController controller =
                                await _mapController.future;

                            controller.animateCamera(
                                CameraUpdate.newLatLng(_initialCamera.target));
                          },
                          tooltip: 'My Location',
                          child: Icon(
                            Icons.my_location,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: TravelModesList()),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          color: Colors.black,
                          textColor: Colors.lime[400],
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(15.0),
                          splashColor: Colors.blueAccent,
                          onPressed: () {},
                          child: Text(
                            "ORDER NOW",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
