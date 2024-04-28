import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trafic/pages/MyHomePage.dart';

import 'animated_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 3 + 70,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: HeaderPainter(),
                    child: SizedBox(
                        width: size.width,
                        height: size.height / 5,
                        child: const Center(
                          child: Text("صمم بواسطة حيدر صادق ",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 241, 7, 7))),
                        )),
                  ),
                  CustomPaint(
                    painter: HeaderPainter(),
                    child: SizedBox(
                      width: size.width,
                      height: size.height / 3,
                      child: const Center(
                        child: Text(
                          'E-Accident Report',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/avatar.png',
                      width: 130,
                      height: 130,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AnimatedTextField(
              primaryColor: Colors.blueGrey,
              beginColor: Colors.white,
              endColor: Colors.blueGrey,
              label: "Email",
              icon: Icons.email,
              duration: const Duration(milliseconds: 300),
              secureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedTextField(
              primaryColor: Colors.blueGrey,
              beginColor: Colors.white,
              endColor: Colors.blueGrey,
              label: "Password",
              icon: Icons.lock,
              duration: const Duration(milliseconds: 300),
              secureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 320,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MyHomePage(),
                    ),
                  );
                },
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "or login with",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaBtn({required Color color, required IconData icon}) {
    return GestureDetector(
      onTap: () {
        // _facebookLogin();
      },
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(10),
        ),
        // child: Center(
        //   child: FaIcon(
        //     icon,
        //     color: color,
        //   ),
        // ),
      ),
    );
  }

  // void _facebookLogin() async {
  //   final result = await _fb.logIn();

  //   switch (result.status) {
  //     case FacebookLoginStatus.success:
  //       // print(result.accessToken!.token);
  //       sendToken(result.accessToken!.token);
  //       break;

  //     case FacebookLoginStatus.cancel:
  //       break;

  //     case FacebookLoginStatus.error:
  //       print(result.error);
  //       break;
  //   }
  // }

//   void sendToken(String facebookToken) async {
//     http.Response response = await http.post(Uri.parse(endpoint + "/api/login"),
//         body: json.encode(
//           {
//             "token": facebookToken,
//           },
//         ),
//         headers: {"Content-Type": "application/json"});

//     if (response.statusCode == 200) {
//       SharedPreferences sharedPreferences =
//           await SharedPreferences.getInstance();
//       var body = json.decode(response.body);
//       sharedPreferences.setString('access_token', body['access_token']);
//       if (!mounted) return;
//       Navigator.pushAndRemoveUntil(context,
//           MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
//     }
//   }
// }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blueGrey;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height + 80, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
