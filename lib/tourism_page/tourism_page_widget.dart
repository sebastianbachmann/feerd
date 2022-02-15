import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TourismPageWidget extends StatefulWidget {
  const TourismPageWidget({Key key}) : super(key: key);

  @override
  _TourismPageWidgetState createState() => _TourismPageWidgetState();
}

class _TourismPageWidgetState extends State<TourismPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).bGColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Tourismus & Freizeit',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}
