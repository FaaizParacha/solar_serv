import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../app_theme.dart';
import '../../utils/size_config.dart';



class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    return Scaffold(
        body: Container(
          color: themeData.primaryColor,
          child: Stack(
            children: <Widget>[
              ClipPath(
                  clipper: _MyCustomClipper(context),
                  child: Container(
                    alignment: Alignment.center,
                    color: themeData.colorScheme.background,
                  )),
              Positioned(
                left: 30,
                right: 30,
                top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.4,
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MySize.size16!, bottom: MySize.size16!),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: MySize.size24!, top: MySize.size8!),
                              child: Text("FORGOT PASSWORD",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline6,
                                      fontWeight: 600)),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: MySize.size16!,
                                  right: MySize.size16!),
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
                                    EdgeInsets.only(top: MySize.size16!),
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size24!)),
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
                                            padding: MaterialStateProperty.all(
                                                Spacing.xy(16, 0))
                                        ),
                                        onPressed: () {},
                                        child: Text("RESET PASSWORD",
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
                  ],
                ),
              ),
              Positioned(
                top: 24,
                left: 12,
                child: BackButton(
                  color: themeData.colorScheme.onBackground,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}