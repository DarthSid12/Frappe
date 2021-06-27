import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frappe/AddNewItem/AddNewItem_widget.dart';
import 'package:frappe/aboutus/aboutus_widget.dart';
import 'package:frappe/expandedpage/expandedpage_widget.dart';
import 'package:frappe/explore/explore_widget.dart';
import 'package:frappe/grocery/grocery_widget.dart';
import 'package:frappe/item_detail/item_detail_widget.dart';
import 'package:frappe/login/login_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../FunctionsFrappe.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> itemWidgetList = [
    Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.tertiaryColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'APPLE',
            style: FlutterFlowTheme.title1.override(
              fontFamily: 'PT Serif',
              color: FlutterFlowTheme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: Container(
              width: 70,
              height: 70,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://picsum.photos/seed/416/600',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
            child: Text(
              'Expires in:4 Days',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Noto Serif',
                color: FlutterFlowTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 2, 5),
            child: Text(
              'Qty: 3 units ',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Noto Serif',
                color: FlutterFlowTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  ];
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    widgetBuilder();
    addListener();
  }

  void addListener() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    String id = prefs.get('fridge');
    FirebaseFirestore.instance.collection('fridges').doc(id).snapshots().listen((event) {
      widgetBuilder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.secondaryColor,
          iconTheme: IconThemeData(color: FlutterFlowTheme.tertiaryColor),
          leading: InkWell(
              onTap:(){
                scaffoldKey.currentState.openDrawer();
              },
              child: Icon(Icons.menu)
          ),
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment(0.05, 0.05),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                'YOUR FRIDGE',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Oswald',
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 300),
              reverseDuration:
              Duration(milliseconds: 300),
              child: AddNewItemWidget(),
            ),
          );
          widgetBuilder();
        },
        backgroundColor: Color(0xFF328FAE),
        icon: Icon(
          Icons.add_circle,
        ),
        label: Text("Add here",style:TextStyle(
          color:FlutterFlowTheme.tertiaryColor
        )),
        elevation: 8,
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
                  onTap: (){
                    Navigator.of(context).pop();
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
                  await Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration:
                      Duration(milliseconds: 300),
                      child: AboutusWidget(),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 4, 50),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: Alignment(0.05, 0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 15, 3),
                      child: TextFormField(
                        controller: textController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Search for item',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Noto Serif',
                            color: Colors.black,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Noto Serif',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'HI THERE! CHECK OUT WHAT\'S INSIDE ME :',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Oswald',
                  color: Color(0xFFFAFAFA),
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    // scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    children: itemWidgetList
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void widgetBuilder() async{
    List totalList = await getItems();
    List<DocumentSnapshot> itemList = totalList[0];
    List<DocumentSnapshot> itemInfoList = totalList[1];
    List<Map> newItemList = [];
    itemWidgetList = [];
    for (DocumentSnapshot item in itemInfoList){
      newItemList.add({
        'name':item.get('name'),
        'expiryDays':item.get('expiryDays'),
        'requiredQuantity':item.get('requiredQuantity'),
        'quantity':itemList.where((DocumentSnapshot element){
          if (element.get('name')==item.get('name')){
            return true;
          }
          return false;
        }).length
      });
    }
    for (Map item in newItemList){
      itemWidgetList.add(
        InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                reverseDuration:
                Duration(milliseconds: 300),
                child: ExpandedpageWidget(itemMap: item,),
              ),
            );
          },
          child: newItemList.indexOf(item)%4==0 || newItemList.indexOf(item)%4==3? Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: FlutterFlowTheme.tertiaryColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item['name'].toString().toUpperCase(),
                  style: GoogleFonts.abel(
                    color: FlutterFlowTheme.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: Container(
                    width: 120,
                    height: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://source.unsplash.com/200x200/?'+item['name']+',grocery',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 1),
                  child: Text(
                    'Expires in:'+item['expiryDays'].toString()+' Days',
                    style: GoogleFonts.abel(
                      color: FlutterFlowTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 2, 5),
                  child: Text(
                    'Qty:'+item['quantity'].toString()+' units ',
                    style: GoogleFonts.abel(
                      color: FlutterFlowTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ):
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: FlutterFlowTheme.secondaryColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  item['name'].toString().toUpperCase(),
                  style: GoogleFonts.abel(
                    color: FlutterFlowTheme.tertiaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: Container(
                    width: 120,
                    height: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://source.unsplash.com/200x200/?'+item['name']+',grocery',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 1),
                  child: Text(
                    'Expires in:'+item['expiryDays'].toString()+' Days',
                    style: GoogleFonts.abel(
                      color: FlutterFlowTheme.tertiaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 2, 5),
                  child: Text(
                    'Qty:'+item['quantity'].toString()+' units ',
                    style: GoogleFonts.abel(
                      color: FlutterFlowTheme.tertiaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        )
      );
    }
    print("Update");
    setState(() {

    });
  }
}

