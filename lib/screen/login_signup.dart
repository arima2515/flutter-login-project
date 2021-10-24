import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:login_singup/config/palette.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.jpg'),
                      fit: BoxFit.fill)),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Welcome to',
                      style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700]),
                      children: [
                        TextSpan(
                            text: ' Rizona',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700]))
                      ],
                    )),
                    const SizedBox(height: 5),
                    Text(
                      'Signup to continue',
                      style: TextStyle(letterSpacing: 1, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
          //trick to add shadow for the submit button
          buildBottomHalfContainer(true),
          //Main container for login and signup
          Positioned(
              top: 200,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 380,
                width: MediaQuery.of(context).size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5)
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.textColor1
                                        : Palette.activeColor),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'SIGNUP',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          buildTextField(Icon(Icons.account_circle_outlined),
                              'User Name', false, false),
                          buildTextField(
                              Icon(Icons.email_outlined), 'Email', true, false),
                          buildTextField(Icon(Icons.lock_outline), 'Password',
                              false, true),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isMale = true;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        margin: const EdgeInsets.only(right: 8),
                                        decoration: BoxDecoration(
                                            color: isMale
                                                ? Palette.textColor2
                                                : Colors.transparent,
                                            border: Border.all(
                                                width: 1,
                                                color: isMale
                                                    ? Colors.transparent
                                                    : Palette.textColor1),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(Icons.person_outline,
                                            color: isMale
                                                ? Colors.white
                                                : Palette.iconColor),
                                      ),
                                      Text('Male',
                                          style: TextStyle(
                                              color: Palette.textColor1))
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 30),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isMale = false;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            decoration: BoxDecoration(
                                                color: isMale
                                                    ? Colors.transparent
                                                    : Palette.textColor2,
                                                border: Border.all(
                                                    width: 1,
                                                    color: isMale
                                                        ? Palette.textColor1
                                                        : Colors.transparent),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Icon(Icons.person_outline,
                                                color: isMale
                                                    ? Palette.iconColor
                                                    : Colors.white),
                                          ),
                                          Text('Female',
                                              style: TextStyle(
                                                  color: Palette.textColor1))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 200,
                            margin: const EdgeInsets.only(top: 20),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text:
                                      "By pressing 'Submit' you agree to our ",
                                  style: TextStyle(color: Palette.textColor2),
                                  children: [
                                    TextSpan(
                                        text: "term & condition",
                                        style: TextStyle(color: Colors.orange))
                                  ]),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          //Trick to add the submit button
          buildBottomHalfContainer(false),
          Positioned(
              top: MediaQuery.of(context).size.height - 100,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text('Or signup with'),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildTextButton(MdiIcons.facebook, 'Facebook',
                            Palette.facebookColor),
                        buildTextButton(
                            MdiIcons.googlePlus, 'Google', Palette.googleColor)
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            minimumSize: Size(155, 40),
            side: BorderSide(width: 1, color: Colors.grey),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: Colors.white),
        child: Row(
          children: [
            new Icon(icon),
            const SizedBox(
              width: 5,
            ),
            Text(title)
          ],
        ));
  }

  Positioned buildBottomHalfContainer(bool showShadow) {
    return Positioned(
        top: 535,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            height: 90,
            width: 90,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  if (showShadow)
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1.5,
                        blurRadius: 10,
                        offset: Offset(0, 1))
                ]),
            child: !showShadow
                ? Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFFFFCC80),
                              Color(0xFFEF5350)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  )
                : Center(),
          ),
        ));
  }

  Widget buildTextField(
      Icon icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0))),
            contentPadding: const EdgeInsets.all(10.0),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1)),
      ),
    );
  }
}
