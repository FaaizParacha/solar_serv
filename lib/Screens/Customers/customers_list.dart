import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:solar_serv/Screens/Auth/log_in.dart';
import 'package:solar_serv/Screens/Customers/Customer_detail_screen.dart';
import '../../app_theme.dart';
import '../../utils/size_config.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key, this.receivingPropertyListTile}) : super(key: key);
  final Widget? receivingPropertyListTile;
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  int? selectedCategory = 0;
  String Heading1 = 'Today';
  String Heading2 = 'Upcoming';
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    customAppTheme = AppTheme.getCustomAppTheme();
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0,top: 10),
              child: GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (context)=>EditProfileScreen()));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.person,color: Colors.blue,),),
              ),
            ),],
        ),
        body: ListView(
            padding: EdgeInsets.all(24),
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                    "1 $Heading1",
                    style: AppTheme.getTextStyle(
                        themeData.textTheme.subtitle1,
                        color: themeData.colorScheme.onSurface,
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: 900,
                        muted: true),
                  ),
                  IconButton(onPressed: (){},
                      icon: Icon(MdiIcons.compassOutline,size: 30,))
                ],)
              ),
              Divider(color: Colors.black,thickness: 3,),
             _customerData(
                 name: 'Mike Lee',
                 street: '555 Ogled St',
                 city: 'Denver',
                 state: 'Colorado',
                 zipcode: '80218',
                 onpress: (){
              Navigator.push(context, MaterialPageRoute(
                   builder: (context)=>
                   const CustomerDetailScreen(
                     name: 'Mike Lee',
                     street: '555 Ogled St',
                     city: 'Denver',
                     state: 'Colorado',
                     zipCode: '80218',
                     date: '',
                   )
               ));
                }
             ),
              SizedBox(height: 20,),
              Text(
                "2 $Heading2",
                style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onSurface,
                    letterSpacing: 2,
                    fontSize: 20,
                    fontWeight: 900,
                    muted: true),
              ),
              Divider(color: Colors.black,thickness: 3,),
              _customerData(
                  name: 'John Smith',
                  date: 'September 30, 2021\n',
                  street: '715 Downing St',
                  city: 'Denver',
                  state: 'Colorado',
                  zipcode: '80218',
                  onpress: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>
                         CustomerDetailScreen(
                          name: 'John Smith',
                          date: 'September 30, 2021\n\n',
                          street: '715 Downing St',
                          city: 'Denver',
                          state: 'Colorado',
                          zipCode: '80218',
                        )
                    ));
                  }
              ),
              _customerData(
                  name: 'Suzy Q',
                  date: 'September 30, 2021\n',
                  street: '715 Downing St',
                  city: 'Denver',
                  state: 'Colorado',
                  zipcode: '80218',
                  onpress: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>
                         CustomerDetailScreen(
                           name: 'Suzy Q',
                           date: 'September 30, 2021\n\n',
                           street: '715 Downing St',
                           city: 'Denver',
                           state: 'Colorado',
                           zipCode: '80218',
                        )
                    ));
                  }
              ),
            ])
    );
  }

  _customerData(
      {
        required String name,
        required String street,
        required String city,
        required String state,
        String date='',
        required String zipcode,
        required VoidCallback onpress,
      }) {
    return Container (
      margin: Spacing.top ( 24 ),
      child: Row (
        children: [
          Expanded (
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text (
                  name,
                  style: AppTheme.getTextStyle (
                      themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onSurface,
                      fontWeight: 800,
                      fontSize: 18,
                      xMuted: true ),
                ),
                SizedBox (
                  height: 4,
                ),
                Text (
                  date+street ,
                  style: AppTheme.getTextStyle (
                      themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onSurface,
                      fontWeight: 800,
                      fontSize: 18,
                      xMuted: true ),
                ),
                SizedBox (
                  height: 4,
                ),
                Text (
                  '${ city } ${ state }, ${ zipcode }',
                  style: AppTheme.getTextStyle (
                      themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: 500 ),
                ),
              ],
            ),
          ),
          IconButton(
          onPressed:onpress,
              icon: Icon(CupertinoIcons.chevron_forward,
                color: Colors.black,size: 30,))
        ],
      ),
    );
  }
}
