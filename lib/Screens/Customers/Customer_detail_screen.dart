import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../../utils/size_config.dart';
import 'CustomerPlan.dart';

class CustomerDetailScreen extends StatefulWidget {
  final String name;
  final String city;
  final String street;
  final String state;
  final String zipCode;
  final String? date;
  const CustomerDetailScreen({this.date,
    Key? key,required this.name,required this.zipCode,
    required this.state,required this.city,
    required this.street
  }) : super(key: key);

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  late ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.all(18),
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 20,color: Colors.black,
                      fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Image.asset('assets/person.png'),
                SizedBox(height: 10,),
                Text(widget.date.toString()+widget.street,
                  style: TextStyle(fontSize: 18,color: Colors.black,
                      fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(widget.city+" "+widget.state+", "+widget.zipCode,
                  style: TextStyle(color: Colors.black, ),
                )
              ],
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 5,
                child:  Container(
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
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>
                                CustomerPlanScreen(
                                  name: 'Mike Lee',
                                  street: '555 Ogled St',
                                  city: 'Denver',
                                  state: 'Colorado',
                                  zipCode: '80218',
                                  date: '',
                                )
                        ));
                      },
                      child: Text("Start",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.button,
                              fontWeight: 600,
                              color: themeData
                                  .colorScheme.onPrimary,
                              letterSpacing: 0.5))),
                ),
            )
          ],

        )
      )
    );
  }
}
