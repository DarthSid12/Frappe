import 'package:frappe/explore/explore_widget.dart';
import 'package:frappe/grocery/grocery_widget.dart';
import 'package:frappe/home_page/home_page_widget.dart';
import 'package:frappe/login/login_widget.dart';
import 'package:page_transition/page_transition.dart';

import '../FunctionsFrappe.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutusWidget extends StatefulWidget {
  AboutusWidget({Key key}) : super(key: key);

  @override
  _AboutusWidgetState createState() => _AboutusWidgetState();
}

class _AboutusWidgetState extends State<AboutusWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.secondaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.secondaryColor),
        automaticallyImplyLeading: true,
        title: Text(
          'ABOUT US',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Noto Serif',
            color: Color(0xFFFAFAFA),
            fontSize: 30,
          ),
        ),
        leading: InkWell(
            onTap:(){
              scaffoldKey.currentState.openDrawer();
            },
            child: Icon(Icons.menu)
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      drawer: Drawer(
        elevation: 16,
        child: Container(
          color: FlutterFlowTheme.secondaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height:40),
              Align(
                alignment: Alignment(-0.02, -0.76),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: Image.asset(
                    'assets/images/StolenLogoWithoutBG.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.1, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Frappe',
                    style: FlutterFlowTheme.title1.override(
                      fontFamily: 'Oswald',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(height:50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(height: 5,width: double.infinity,decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3)
                ),),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 300),
                        reverseDuration:
                        Duration(milliseconds: 300),
                        child: HomePageWidget(),
                      ),
                          (r) => false,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      // color: FlutterFlowTheme.tertiaryColor,
                      // border: Border.symmetric(vertical: BorderSide(width: 1,color: Colors.black))
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.house,
                        color: FlutterFlowTheme.primaryColor,
                      ),
                      title: Text(
                        'HOME PAGE',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.secondaryColor,
                      dense: false,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration:
                      Duration(milliseconds: 300),
                      child: GroceryWidget(),
                    ),
                        (r) => false,
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  title: Text(
                    'GROCERY LIST',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: FlutterFlowTheme.secondaryColor,
                  dense: false,
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: FlutterFlowTheme.tertiaryColor,
              //       border: Border.symmetric(vertical: BorderSide(width: 2))
              //   ),
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.add_circle_sharp,
              //       color: FlutterFlowTheme.primaryColor,
              //     ),
              //     title: Text(
              //       'ADD ITEM',
              //       style: FlutterFlowTheme.title3.override(
              //         fontFamily: 'Poppins',
              //         color: FlutterFlowTheme.primaryColor,
              //       ),
              //     ),
              //     trailing: Icon(
              //       Icons.arrow_forward_ios,
              //       color: Color(0xFF303030),
              //       size: 20,
              //     ),
              //     tileColor: FlutterFlowTheme.secondaryColor,
              //     dense: false,
              //   ),
              // ),
              InkWell(
                onTap: () async {
                  await Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration:
                      Duration(milliseconds: 300),
                      child: ExploreWidget(),
                    ),
                        (r) => false,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    // color: FlutterFlowTheme.tertiaryColor,
                    // border: Border.symmetric(vertical: BorderSide(width: 2))
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search_off_sharp,
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    title: Text(
                      'EXPLORE PAGE',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.secondaryColor,
                    dense: false,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_history,
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    title: Text(
                      'ABOUT US',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.secondaryColor,
                    dense: false,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await logout();
                  await Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration:
                      Duration(milliseconds: 300),
                      child: LoginWidget(),
                    ),
                        (r) => false,
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: FlutterFlowTheme.primaryColor,
                  ),
                  title: Text(
                    'LOG OUT',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: FlutterFlowTheme.secondaryColor,
                  dense: false,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(110, 30, 0, 0),
                child: Text(
                  'OUR DEVELOPERS',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Oswald',
                    color: Color(0xFFFAFAFA),
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(120, 40, 0, 3),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://icons-for-free.com/iconfiles/png/512/business+face+people+icon-1320086457520622872.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(135, 0, 0, 10),
                child: Text(
                  'Siddharth Agrawal',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Nobile',
                    color: Color(0xFFFAFAFA),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/8_avatar-512.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(135, 0, 0, 0),
                child: Text(
                  'Madhav Lodha',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFFFAFAFA),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(120, 20, 0, 0),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://planw.in/wp-content/uploads/2021/02/avatar-4.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(135, 0, 0, 0),
                child: Text(
                  'Saloni Agrawal',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFFFAFAFA),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(120, 20, 0, 0),
                child: Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://art.ngfiles.com/images/1416000/1416404_alert222_script-alert-1-script.png?f1599429715',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(135, 0, 0, 0),
                child: Text(
                  'Keshav Lodha',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                ),
              ),
              SizedBox(height:50)
            ],
          ),
        ),
      ),
    );
  }
}
