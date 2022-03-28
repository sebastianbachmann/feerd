import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KindergartensPageWidget extends StatefulWidget {
  const KindergartensPageWidget({Key key}) : super(key: key);

  @override
  _KindergartensPageWidgetState createState() =>
      _KindergartensPageWidgetState();
}

class _KindergartensPageWidgetState extends State<KindergartensPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).bGColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Kindergärten',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<ApiCallResponse>(
            future: FeerdKindergartensCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final columnFeerdKindergartensResponse = snapshot.data;
              return Builder(
                builder: (context) {
                  final kiga = getJsonField(
                        (columnFeerdKindergartensResponse?.jsonBody ?? ''),
                        r'''$.data''',
                      )?.toList() ??
                      [];
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(kiga.length, (kigaIndex) {
                        final kigaItem = kiga[kigaIndex];
                        return ListTile(
                          title: Text(
                            getJsonField(
                              kigaItem,
                              r'''$.name''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          subtitle: Text(
                            getJsonField(
                              kigaItem,
                              r'''$.link_to_url''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).subtitle2,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF303030),
                            size: 20,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          dense: false,
                        );
                      }),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
