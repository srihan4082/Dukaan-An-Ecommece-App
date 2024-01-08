import '../../shop/screens/app_properties.dart';
// import 'package:ecommerce_int2/screens/faq_page.dart';
// import 'package:ecommerce_int2/screens/payment/payment_page.dart';
// import 'package:ecommerce_int2/screens/settings/settings_page.dart';
import '../../shop/screens/tracking_package.dart';
// import 'package:ecommerce_int2/screens/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage: AssetImage('images/background.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      FirebaseAuth.instance.currentUser!.email!.split('@')[0],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: transparentYellow,
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  height: 150,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.wallet),
                              onPressed:(){},
                            ),
                            Text(
                              'Wallet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.local_shipping),
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => TrackingPage())),
                            ),
                            Text(
                              'Shipped',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.card_giftcard),
                              onPressed:(){},
                            ),
                            Text(
                              'Payment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.contact_emergency), onPressed: () {},
                            ),
                            Text(
                              'Support',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Settings'),
                  subtitle: Text('Privacy and logout'),
                  leading: Icon(Icons.settings),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Text('Help & Support'),
                  subtitle: Text('Help center and legal support'),
                  leading: Icon(Icons.support),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: yellow,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('FAQ'),
                  subtitle: Text('Questions and Answer'),
                  leading: Icon(Icons.question_answer),
                  trailing: Icon(Icons.chevron_right, color: yellow),
                  onTap: () {},
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}