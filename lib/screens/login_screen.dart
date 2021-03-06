import 'package:flutter/material.dart';
import 'package:miniproject/customwidget/dialog.dart';

import 'package:miniproject/customwidget/gradient_container.dart';
import 'package:miniproject/customwidget/text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  final kLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        CustomTextField(
          hint: 'Enter your Email',
          icon: Icon(
            Icons.email_rounded,
            color: Colors.white,
          ),
          secured: false,
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        CustomTextField(
          hint: "Enter your Password",
          icon: Icon(
            Icons.lock_rounded,
            color: Colors.white,
          ),
          secured: true,
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Pressed'),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _rememberMe = !_rememberMe;
          });
        },
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _rememberMe,
                checkColor: Theme.of(context).canvasColor,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
            ),
            Text(
              'Remember me',
              style: kLabelStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Theme.of(context).canvasColor,
          backgroundColor: Colors.white,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.all(15.0),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  description: 'You have successfully logged in',
                  title: "Login Success",
                );
              });
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  String capitalize(String? msg) {
    return "${msg![0].toUpperCase()}${msg.substring(1)}";
  }

  Widget _buildSocialBtn(
      AssetImage logo, EdgeInsetsGeometry padding, double size) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              RegExpMatch? result =
                  RegExp(r'^assets/(.*).png$').firstMatch(logo.assetName);
              return CustomDialogBox(
                description:
                    'You have successfully logged in using ${capitalize(result![1])}',
                title: '${capitalize(result[1])} Login Success',
              );
            });
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: padding,
          child: Image(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow(double size) {
    size > 100 ? size = 100 : size = size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSocialBtn(
            AssetImage(
              'assets/google.png',
            ),
            EdgeInsets.zero,
            size,
          ),
          _buildSocialBtn(
            AssetImage(
              'assets/facebook.png',
            ),
            EdgeInsets.zero,
            size,
          ),
          _buildSocialBtn(
            AssetImage(
              'assets/twitter.png',
            ),
            EdgeInsets.all(5.0),
            size,
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Pressed'),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an Account? ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.075,
                vertical: MediaQuery.of(context).size.height * 0.075,
              ),
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth >=
                    MediaQuery.of(context).size.height) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 10,
                        child: FittedBox(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: constraints.maxWidth * 0.55,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildEmailTF(),
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                  _buildPasswordTF(),
                                  _buildForgotPasswordBtn(),
                                  _buildRememberMeCheckbox(),
                                  _buildLoginBtn(),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.45,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.075,
                            ),
                            child: Column(
                              children: [
                                _buildSignInWithText(),
                                _buildSocialBtnRow(
                                    constraints.maxWidth * 0.45 / 5),
                                _buildSignupBtn(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      child: FittedBox(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    _buildEmailTF(),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buildPasswordTF(),
                    _buildForgotPasswordBtn(),
                    _buildRememberMeCheckbox(),
                    _buildLoginBtn(),
                    _buildSignInWithText(),
                    _buildSocialBtnRow(constraints.maxWidth / 5),
                    _buildSignupBtn(),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
