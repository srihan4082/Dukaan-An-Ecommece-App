// import 'dart:html';
import 'package:dukaan_1/features/shop/screens/home.dart';
import 'package:flutter/material.dart';
// import 'login.dart';
import 'registration.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'features/shop/screens/auth_func.dart';

void main() {
  // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const MyApp()),
  ));
}

// Add GoRouter configuration outside the App class
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHome(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen(
              actions: [
                ForgotPasswordAction(((context, email) {
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: <String, String?>{
                      'email': email,
                    },
                  );
                  context.push(uri.toString());
                })),
                AuthStateChangeAction(((context, state) {
                  final user = switch (state) {
                    SignedIn state => state.user,
                    UserCreated state => state.credential.user,
                    _ => null
                  };
                  if (user == null) {
                    return;
                  }
                  if (state is UserCreated) {
                    user.updateDisplayName(user.email!.split('@')[0]);
                  }
                  if (!user.emailVerified) {
                    user.sendEmailVerification();
                    const snackBar = SnackBar(
                        content: Text(
                            'Please check your email to verify your email address'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else
                    context.pushReplacement('/home-page');
                })),
              ],
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                final arguments = state.uri.queryParameters;
                return ForgotPasswordScreen(
                  email: arguments['email'],
                  headerMaxExtent: 200,
                );
              },
            ),
            // GoRoute(
            //   path: 'home-page',
            //   builder: (context, state) {
            //     // Return the widget for your custom page
            //     return HomePage();
            //   },
            // ),
          ],
        ),
        GoRoute(
          path: 'home-page',
          builder: (context, state) {
            // Return the widget for your custom page
            return HomePage();
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return ProfileScreen(
              providers: const [],
              actions: [
                SignedOutAction((context) {
                  context.pushReplacement('/');
                }),
              ],
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      routerConfig: _router,
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage('images/icon1.png'),
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "DUKAAN",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Image.asset("images/welcome2.png"),
                ),
                Consumer<ApplicationState>(
                  builder: (context, appState, _) => AuthFunc(
                      loggedIn: appState.loggedIn,
                      signOut: () {
                        FirebaseAuth.instance.signOut();
                      }),
                ),
                // OutlinedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => LoginPage()),
                //     );
                //   },
                //   child: Text("Sign In"),
                //   style: OutlinedButton.styleFrom(
                //     side: BorderSide(
                //       color: Colors.white,
                //       width: 2.0,
                //     ),
                //     foregroundColor: Colors.white,
                //     minimumSize: Size(205.0, 45.0),
                //   ),
                // ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Register"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.lightBlueAccent,
                    backgroundColor: Colors.white,
                    minimumSize: Size(205.0, 45.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
