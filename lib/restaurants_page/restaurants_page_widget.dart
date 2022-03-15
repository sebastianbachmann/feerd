import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantsPageWidget extends StatefulWidget {
  const RestaurantsPageWidget({Key key}) : super(key: key);

  @override
  _RestaurantsPageWidgetState createState() => _RestaurantsPageWidgetState();
}

class _RestaurantsPageWidgetState extends State<RestaurantsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).bGColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Restaurants',
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<ApiCallResponse>(
            future: FeerdRestaurantsCall.call(),
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
              final columnFeerdRestaurantsResponse = snapshot.data;
              return Builder(
                builder: (context) {
                  final restaurant = getJsonField(
                        (columnFeerdRestaurantsResponse?.jsonBody ?? ''),
                        r'''$.data''',
                      )?.toList() ??
                      [];
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(restaurant.length, (restaurantIndex) {
                        final restaurantItem = restaurant[restaurantIndex];
                        return ListTile(
                          title: Text(
                            getJsonField(
                              restaurantItem,
                              r'''$.name''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          subtitle: Text(
                            getJsonField(
                              restaurantItem,
                              r'''$.description''',
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
