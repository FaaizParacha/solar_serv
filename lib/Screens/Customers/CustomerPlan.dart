import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../app_theme.dart';
import '../../utils/size_config.dart';
import 'customers_list.dart';

class CustomerPlanScreen extends StatefulWidget {
  final String name;
  final String city;
  final String street;
  final String state;
  final String zipCode;
  final String? date;
  const CustomerPlanScreen({this.date,
    Key? key,required this.name,required this.zipCode,
    required this.state,required this.city,
    required this.street
  }) : super(key: key);

  @override
  State<CustomerPlanScreen> createState() => _CustomerPlanScreenState();
}

class _CustomerPlanScreenState extends State<CustomerPlanScreen> {
  late ThemeData themeData;
  bool isChecked = false;

  PickedFile? imageFile=null;
  PickedFile? imageFile1=null;
  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    if(imageFile==null){
    setState(() {
      imageFile = pickedFile;
    });}else{
    setState(() {
      imageFile1 = pickedFile;
    });}

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    if(imageFile==null){
      setState(() {
        imageFile = pickedFile;
      });}else{
      setState(() {
        imageFile1 = pickedFile;
      });}
    Navigator.pop(context);
  }
  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title:  Text("Choose option",style: TextStyle(
            color:  themeData.colorScheme.onBackground),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.black),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: themeData
                    .colorScheme.primary,),
              ),

              Divider(height: 1,color:  themeData
                  .colorScheme.onBackground),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: themeData
                    .colorScheme.primary),
              ),
            ],
          ),
        ),);
    });
  }

  bool visibilityroof = false;
  bool visibilitywash = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "Roof"){
        visibilityroof = visibility;
      }
      if (field == "Wash"){
        visibilitywash = visibility;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    SizedBox midpadding =const SizedBox(height: 10,);
    SizedBox widthpadding =const SizedBox(width: 8,);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:  IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
      ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.all(18),
                  children: [
                    Text(
                      widget.name,
                      style:const TextStyle(fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),),
                    midpadding,midpadding,
                    Text(widget.date.toString()+widget.street,
                      style:const TextStyle(fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),),
                    midpadding,midpadding,
                    Text(widget.city+" "+widget.state+", "
                        +widget.zipCode,
                      style:const TextStyle(color: Colors.black, ),
                    ),
                    midpadding,midpadding,
                    const Text(
                      'Plan A',
                      style: TextStyle(fontSize: 20,color: Colors.black,
                          fontWeight: FontWeight.bold),),
                    midpadding,midpadding,
                    const Text('\t\t Required',
                      style: TextStyle(color: Colors.black,
                      fontSize: 18,
                      ),
                    ),
                    midpadding,midpadding,
                    CheckboxRow(text:'Roof Leak Check',onpress: (){
                      visibilityroof ? null : _changed(true, "Roof");
                    }),
                    midpadding,
                    CheckboxRow(text:'Wash Solar Panels',onpress: (){}),
                    midpadding,
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          (imageFile==null)? Expanded(
                            child: Button(text: 'Before Photo',
                            onpress: (){
                        _showChoiceDialog(context);
                            },
                            width: MediaQuery.of(context).size.width/3,
                      ),
                          ):Expanded(
                        child: Container(
                          height: 200,
                              padding: const EdgeInsets.only(left: 15.0,right: 15),
                              child:Image.file( File(imageFile!.path)),
                            ),
                      ),
                          (imageFile==null||imageFile1==null)? widthpadding
                              :const VerticalDivider(color: Colors.black,thickness: 5,
                           indent: 25,endIndent: 25
                          ),
                          (imageFile1==null)? Expanded(
                            child: Button(text: 'After Photo',
                              onpress: (){
                                _showChoiceDialog(context);
                              },
                              width:0,
                            ),
                          ):Expanded(
                            child: Container(
                              height: 200,
                              padding: const EdgeInsets.only(left: 15.0,right: 15),
                              child:Image.file( File(imageFile1!.path)),
                            ),
                          ),
                      ],),
                    ),
                    Row(children: [
                     ( imageFile!=null)?Expanded(
                        child: TextButton.icon(
                          label: Text('Before',style: TextStyle(color: Colors.black,),),
                          icon: Icon(FontAwesomeIcons.penToSquare,color: Colors.black,),
                          onPressed: () {
                            _showChoiceDialog(context);
                          },
                        ),
                      ):Container(),
                      (imageFile1!=null)?Expanded(
                        child: TextButton.icon(
                          icon: Icon(FontAwesomeIcons.penToSquare,color: Colors.black,),
                          label: Text('After',style: TextStyle(color: Colors.black,),),
                          onPressed: () {
                            _showChoiceDialog(context);
                          },
                        ),
                      ):Container()
                    ],),
                    midpadding,
                    visibilityroof?TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                      fillColor: Colors.white,
                        filled: true,
                        hintText: 'Write a comment',
                          border:  OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(8.0),
                          ),
                        hintStyle: TextStyle(color: Colors.black)
                      ),
                    ):Container(),
                    visibilityroof?Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: Text('')),
                        Expanded(
                          child: Button(text: 'Cancel',
                            onpress: (){
                              _changed(false, "Roof");
                            },
                            width: MediaQuery.of(context).size.width/3,
                          ),
                        ),widthpadding,
                        Expanded(
                          child: Button(text: 'Save',
                            onpress: (){},
                            width:0,
                          ),
                        )
                      ],):Container(),
                    midpadding,midpadding,
                    const Text('\t\t Suggested',
                      style: TextStyle(color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    midpadding,midpadding,
                    CheckboxRow(text:'Wash Solar Panels',onpress: (){}),
                  ],
                ),
                Positioned(
                  left: 25,
                  right: 25,
                  bottom: 5,
                  child:  Button(
                    width: MediaQuery.of(context).size.width,
                    text: 'Done',
                      onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomerList()));
                  },
                ))
              ],

            )
        )
    );
  }
  Widget CheckboxRow({
    required String text,
    required VoidCallback onpress,
  })
  {
    return Row( children: [
      RoundCheckBox(
        onTap: (selected) {},),
      const SizedBox(width: 8,),
       Text(text,
        style: TextStyle(fontSize: 18,
          color: Colors.black,
        ),),
      const Spacer(),
      IconButton(
          onPressed:onpress,
          icon:const FaIcon(FontAwesomeIcons.penToSquare,))
    ],);
  }

  Widget Button({
  required String text,
    required VoidCallback onpress,
    required double width,
}){
    return Container(
      margin:
      EdgeInsets.only(top: 16),
      width:width,
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
          onPressed: onpress,
          // onPressed: () {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) =>const CustomerList()));
          // },
          child: Text(text,
              style: AppTheme.getTextStyle(
                  themeData.textTheme.button,
                  fontWeight: 600,
                  color: themeData
                      .colorScheme.onPrimary,
                  letterSpacing: 0.5))),
    );
  }
}
