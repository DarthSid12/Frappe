import 'package:fluttertoast/fluttertoast.dart';

import '../FunctionsFrappe.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.secondaryColor,
          iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment(0.05, 0.05),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'LOGIN',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Noto Serif',
                  color: FlutterFlowTheme.tertiaryColor,
                ),
              ),
            ),
          ),
          actions: [],
          elevation: 4,
        ),
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF110631),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 80),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:50),
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
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Container(
                      width: 285,
                      height: 40,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(0, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Refrigerator ID',
                                  hintStyle: GoogleFonts.getFont(
                                    'Raleway',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF3C2452),
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF3C2452),
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.getFont(
                                  'Raleway',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.95, 0.5),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                    child: FFButtonWidget(
                      onPressed: () async {
                        String result = await login(textController.text);
                        await Fluttertoast.showToast(msg: result,gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_LONG,backgroundColor: FlutterFlowTheme.secondaryColor,textColor: FlutterFlowTheme.tertiaryColor);
                        if (result.contains("ran")){
                          return;
                        }
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
                      text: 'ENTER',
                      options: FFButtonOptions(
                        width: 125,
                        height: 40,
                        color: FlutterFlowTheme.secondaryColor,
                        textStyle: GoogleFonts.getFont(
                          'Lato',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        borderSide: BorderSide(
                          color: Color(0xEF000000),
                          width: 2,
                        ),
                        borderRadius: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      'Refrigerators\n',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Oswald',
                        color: Color(0xFFFAFAFA),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
                    child: Text(
                      'A perfect example of what truly matters is \n on the inside',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Oswald',
                        color: Color(0xFF4BB0D2),
                        fontSize: 19,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
