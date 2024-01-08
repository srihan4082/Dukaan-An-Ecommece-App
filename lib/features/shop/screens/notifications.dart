import 'app_properties.dart';
import 'ratings.dart';
import 'tracking_package.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: SafeArea(
        child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Notification',
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CloseButton()
                ],
              ),
              Flexible(
                child: ListView(
                  children: <Widget>[
                    // Share your feedback.
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              SizedBox(
                                height: 110,
                                width: 110,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                    left: 5.0,
                                    bottom: -10.0,
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Transform.scale(
                                        scale: 1.2,
                                        child: Image.asset(
                                            'images/bottom_yellow.png'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8.0,
                                    left: 10.0,
                                    child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                            'images/pixel8pro.png')),
                                  )
                                ]),
                              ),
                              Flexible(
                                child: Column(children: [
                                  Text(
                                      'Google Pixel 8 Pro',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                  SizedBox(height:4.0),
                                  Text(
                                      'Your package has been delivered. Thanks for shopping!',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10))
                                ]),
                              )
                            ]),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => RatingPage())),
                            child: Container(
                                padding: const EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                    color: yellow,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5.0),
                                        bottomLeft: Radius.circular(5.0))),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Share your feedback',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ))),
                          )
                        ],
                      ),
                    ),
                    // Track the product.
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              SizedBox(
                                height: 110,
                                width: 110,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                    left: 5.0,
                                    bottom: -10.0,
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Transform.scale(
                                        scale: 1.2,
                                        child: Image.asset(
                                            'images/bottom_yellow.png'),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 8.0,
                                    left: 10.0,
                                    child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                            'images/headphone_9.png')),
                                  )
                                ]),
                              ),
                              Flexible(
                                child: Column(children: [
                                  Text(
                                      'Boat Rockerz 440 On-Ear Bluetooth Headphones',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                  SizedBox(height:4.0),
                                  Text(
                                      'Your package has been dispatched. You can keep track of your product.',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10))
                                ]),
                              )
                            ]),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => TrackingPage())),
                            child: Container(
                                padding: const EdgeInsets.all(14.0),
                                decoration: BoxDecoration(
                                    color: yellow,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5.0),
                                        bottomLeft: Radius.circular(5.0))),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Track the product',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }
}