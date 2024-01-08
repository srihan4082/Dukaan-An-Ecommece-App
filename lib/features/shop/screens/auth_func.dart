// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:dukaan_1/features/shop/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: OutlinedButton(
                    onPressed: () {
                      if(!loggedIn)
                        context.push('/sign-in');
                      else
                        context.push('/home-page');
                    },
                    child:  const Text('Sign In') ,
                    style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          foregroundColor: Colors.white,
                          minimumSize: Size(205.0, 45.0),
                        ),
                    ),
              ),
              Visibility(
                visible: loggedIn,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: OutlinedButton(
                      onPressed: () {
                        context.push('/profile');
                      },
                      child: const Text('Profile')),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}