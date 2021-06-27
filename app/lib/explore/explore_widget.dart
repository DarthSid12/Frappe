import 'package:frappe/grocery/grocery_widget.dart';
import 'package:frappe/home_page/home_page_widget.dart';
import 'package:frappe/login/login_widget.dart';
import 'package:page_transition/page_transition.dart';

import '../FunctionsFrappe.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreWidget extends StatefulWidget {
  ExploreWidget({Key key}) : super(key: key);

  @override
  _ExploreWidgetState createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.secondaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap:(){
              scaffoldKey.currentState.openDrawer();
            },
            child: Icon(Icons.menu)
        ),
        title: Text(
          'EXPLORE FOOD',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Noto Serif',
            color: Color(0xFFFAFAFA),
          ),
        ),

        // actions: [
        //   Padding(
        //     padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
        //     child: Icon(
        //       Icons.add_rounded,
        //       color: FlutterFlowTheme.primaryColor,
        //       size: 24,
        //     ),
        //   )
        // ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
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
                  onTap: () async{
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
                  Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                          child: Text(
                            '      AMAZING DISHES THAT YOU CAN TRY AT HOME:',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFAFAFA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.tertiaryColor,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            'HEALTHY AND TASTY',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            '               VEGAN ICE CREAM',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.subtitle1
                                                .override(
                                              fontFamily: 'Noto Serif',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Craving ice cream but don\'t want to skip on your diet? Try out vegan ice creams right now!',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 4),
                                          child: Icon(
                                            Icons.schedule,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 0, 0, 0),
                                          child: Text(
                                            '                                       30 mins',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 0, 0, 4),
                                          child: Icon(
                                            Icons.location_on_sharp,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.tertiaryColor,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/images/card_header@2x.png',
                                    width: MediaQuery.of(context).size.width,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            'SALADS         ',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            '            GREEK CHICKEN SALAD',
                                            style: FlutterFlowTheme.subtitle1
                                                .override(
                                              fontFamily: 'Noto Serif',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '              Happiness is.... A fresh Greek Salad :)',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 4),
                                          child: Icon(
                                            Icons.schedule,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 0, 0, 0),
                                          child: Text(
                                            '                                  10 mins',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 0, 0, 4),
                                          child: Icon(
                                            Icons.location_on_sharp,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.tertiaryColor,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            'CHEAT MEAL',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.secondaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 4, 0, 0),
                                          child: Text(
                                            '          SPAGHETTI BOLOGNESE',
                                            style: FlutterFlowTheme.subtitle1
                                                .override(
                                              fontFamily: 'Noto Serif',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Good job on maintaining that diet the whole week! Now enjoy your cheat day with the best cheat meal :p',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 4, 12, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 4),
                                          child: Icon(
                                            Icons.schedule,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 0, 0, 0),
                                          child: Text(
                                            '                            45 mins       ',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 0, 0, 4),
                                          child: Icon(
                                            Icons.location_on_sharp,
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
