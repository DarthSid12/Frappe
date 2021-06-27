import 'package:flutter/cupertino.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class ExpandedpageWidget extends StatefulWidget {
  Map itemMap = {};
  ExpandedpageWidget({Key key,this.itemMap}) : super(key: key);

  @override
  _ExpandedpageWidgetState createState() => _ExpandedpageWidgetState();
}

class _ExpandedpageWidgetState extends State<ExpandedpageWidget> {
  // TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String itemName = "Item Name";
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    // textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    setInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.secondaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        // flexibleSpace: Align(
        //   alignment: Alignment(0.05, 0.05),
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        //     child: Text(
        //       itemName,
        //       style: FlutterFlowTheme.bodyText1.override(
        //         fontFamily: 'Noto Serif',
        //         color: FlutterFlowTheme.secondaryColor,
        //         fontStyle: FontStyle.italic,
        //       ),
        //     ),
        //   ),
        // ),
        title: Text(itemName.toUpperCase(),style: FlutterFlowTheme.bodyText1.override(
          fontFamily: 'Noto Serif',
          color: Color(0xFFFAFAFA),
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),),
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 2),
                child: Text(
                  'EDIT ITEM DETAILS',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Noto Serif',
                    color: Color(0xFFFAFAFA),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: imageUrl==""? Icon(
                  Icons.border_color,
                  color: Color(0xFFFAFAFA),
                  size: 70,
                ):Image.network(imageUrl,height: 300,width: 300,errorBuilder: (context,_,_2){
                  return Icon(
                    Icons.border_color,
                    color: Color(0xFFFAFAFA),
                    size: 70,
                  );
                },),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: Text(itemName.toUpperCase(),style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Noto Serif',
                        color: Color(0xFFFAFAFA),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                    //   child: TextFormField(
                    //     controller: textController1,
                    //     obscureText: false,
                    //     decoration: InputDecoration(
                    //       hintText: 'Enter Item Name',
                    //       hintStyle: FlutterFlowTheme.bodyText1.override(
                    //         fontFamily: 'Noto Serif',
                    //         color: FlutterFlowTheme.secondaryColor,
                    //         fontStyle: FontStyle.italic,
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: FlutterFlowTheme.tertiaryColor,
                    //           width: 1,
                    //         ),
                    //         borderRadius: const BorderRadius.only(
                    //           topLeft: Radius.circular(4.0),
                    //           topRight: Radius.circular(4.0),
                    //         ),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: FlutterFlowTheme.tertiaryColor,
                    //           width: 1,
                    //         ),
                    //         borderRadius: const BorderRadius.only(
                    //           topLeft: Radius.circular(4.0),
                    //           topRight: Radius.circular(4.0),
                    //         ),
                    //       ),
                    //       filled: true,
                    //       fillColor: Color(0xFFFAFAFA),
                    //     ),
                    //     style: FlutterFlowTheme.bodyText1.override(
                    //       fontFamily: 'Noto Serif',
                    //       color: FlutterFlowTheme.secondaryColor,
                    //       fontStyle: FontStyle.italic,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        height:50,
                        color: FlutterFlowTheme.tertiaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Enter Expiry Date',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Noto Serif',
                                color: FlutterFlowTheme.secondaryColor,
                                fontStyle: FontStyle.italic,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Noto Serif',
                              color: FlutterFlowTheme.secondaryColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        height: 50,
                        color: FlutterFlowTheme.tertiaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: TextFormField(
                            controller: textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Enter Minimum Required Quantity ',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Noto Serif',
                                color: FlutterFlowTheme.secondaryColor,
                                fontStyle: FontStyle.italic,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Noto Serif',
                              color: FlutterFlowTheme.secondaryColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        height: 50,
                        color: FlutterFlowTheme.tertiaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: TextFormField(
                            controller: textController4,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Current Quantity',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Noto Serif',
                                color: FlutterFlowTheme.secondaryColor,
                                fontStyle: FontStyle.italic,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFAFAFA),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFAFAFA),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Noto Serif',
                              color: FlutterFlowTheme.secondaryColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:30),
                    Center(
                      child: InkWell(
                        child: Container(
                          height:60,
                          width: 120,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.secondaryColor,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text("UPDATE",style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Noto Serif',
                              color: Color(0xFFFAFAFA),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height:30)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void setInitialValues(){
    Map itemMap = widget.itemMap;
    if (itemMap !={}){
      itemName = itemMap['name'];
      imageUrl = 'https://source.unsplash.com/300x300/?'+itemMap['name']+',grocery';
      textController2.text = itemMap['expiryDays'].toString();
      textController3.text = itemMap['requiredQuantity'].toString();
      textController4.text = itemMap['quantity'].toString();
    }
  }
}
