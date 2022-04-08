
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:solar_serv/Screens/Auth/forgot_password.dart';
import 'package:solar_serv/Screens/Auth/register.dart';
import 'package:solar_serv/Screens/Customers/customers_list.dart';
// app development files
import '../../app_theme.dart';
import '../../utils/size_config.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _passwordVisible = false, _check = false;
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 30,
              right: 30,
              top: size.height * 0.25,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // SvgPicture.asset(
                  //   "./assets/Icons/house-comment-active.svg",
                  //   height: size.height * 0.15,
                  // ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 16),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                bottom: 24, top: 0),
                            child: Text(
                              "Solar Serv",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  fontWeight: 600),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 16,
                                right: 16),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      letterSpacing: 0.1,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 500),
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        letterSpacing: 0.1,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        fontWeight: 500),
                                    prefixIcon:
                                    Icon(MdiIcons.emailOutline),
                                  ),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(top: 16),
                                  child: TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        letterSpacing: 0.1,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        fontWeight: 500),
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          letterSpacing: 0.1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      prefixIcon:
                                      Icon(MdiIcons.lockOutline),
                                      suffixIcon: IconButton(
                                        icon: Icon(_passwordVisible!
                                            ? MdiIcons.eyeOutline
                                            : MdiIcons.eyeOffOutline),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                            !_passwordVisible!;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _passwordVisible!,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ForgotPasswordScreen())
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 16),
                                    alignment: Alignment.centerRight,
                                    child: RichText(
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                            text: " Forgot Password?",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2,
                                                fontWeight: 600,
                                                color:
                                                themeData.colorScheme.primary)),
                                      ]),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                        activeColor:
                                        themeData.colorScheme.primary,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _check = value;
                                          });
                                        },
                                        value: _check,
                                        visualDensity:
                                        VisualDensity.compact,
                                      ),
                                      Text(
                                        "Remember me",
                                        style: themeData
                                            .textTheme.bodyText2!
                                            .merge(TextStyle(
                                            color: themeData
                                                .colorScheme
                                                .onSurface)),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only(top: 16),
                                  width:
                                  MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(24)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: themeData
                                            .colorScheme.primary
                                            .withAlpha(18),
                                        blurRadius: 3,
                                        offset: Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>const CustomerList()));
                                      },
                                      child: Text("LOGIN",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.button,
                                              fontWeight: 600,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              letterSpacing: 0.5))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Don't have an Account? ",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 500)),
                            TextSpan(
                                text: " Register",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600,
                                    color:
                                    themeData.colorScheme.primary)),
                          ]),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        )
    );
  }
}