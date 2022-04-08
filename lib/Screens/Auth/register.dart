import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../app_theme.dart';
import '../../utils/size_config.dart';
import 'log_in.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;
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
              left: MySize.size30,
              right: MySize.size30,
              top: size.height * 0.35,
              child: Column(
                children: <Widget>[
                  // SvgPicture.asset(
                  //   "assets/Icons/house-comment-active.svg",
                  //   height: size.height * 0.15,
                  // ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size16!),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: MySize.size8!),
                            child: Text(
                              "REGISTER",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  fontWeight: 600),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: MySize.size16!, right: MySize.size16!, top: MySize.size8!),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  child: TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        fontWeight: 500),
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      prefixIcon:
                                      Icon(MdiIcons.emailOutline),
                                    ),
                                    keyboardType:
                                    TextInputType.emailAddress,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16!),
                                  child: TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color: themeData
                                            .colorScheme.onBackground,
                                        fontWeight: 500),
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500),
                                      prefixIcon:
                                      Icon(MdiIcons.lockOutline),
                                      suffixIcon: IconButton(
                                        icon: Icon(_passwordVisible
                                            ? MdiIcons.eyeOutline
                                            : MdiIcons.eyeOffOutline),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                            !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText: _passwordVisible,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: MySize.size24!),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size24!)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: themeData
                                              .colorScheme.primary
                                              .withAlpha(28),
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              1),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(Spacing.xy(16, 0))
                                        ),
                                        onPressed: () {},
                                        child: Text("REGISTER",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.button,
                                                fontWeight: 600,
                                                color: themeData.colorScheme
                                                    .onPrimary)))),
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
                              builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: MySize.size16!, bottom: MySize.size8!),
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "I've already an Account? ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 500)),
                          TextSpan(
                              text: " Login",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.primary)),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: MySize.size24,
              left: MySize.size12,
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        )
    );
  }
}