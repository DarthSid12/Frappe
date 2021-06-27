import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDetailWidget extends StatefulWidget {
  ItemDetailWidget({Key key}) : super(key: key);

  @override
  _ItemDetailWidgetState createState() => _ItemDetailWidgetState();
}

class _ItemDetailWidgetState extends State<ItemDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.secondaryColor,
          iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment(0.05, 0.05),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'UPDATE',
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 225, 0, 0),
              child: ListTile(
                leading: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.primaryColor,
                  size: 40,
                ),
                title: Text(
                  'ADD ITEMS',
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Noto Serif',
                  ),
                ),
                subtitle: Text(
                  'Use this button to add items',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                  ),
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: ListTile(
                leading: Icon(
                  Icons.delete_sharp,
                  color: FlutterFlowTheme.primaryColor,
                  size: 40,
                ),
                title: Text(
                  'DELETE ITEMS',
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Noto Serif',
                  ),
                ),
                subtitle: Text(
                  'Use this botton to delete items',
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                  ),
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
