import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GETAllNewsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GET All News',
      apiUrl: 'https://qyjboplixgdbbvzqojdz.supabase.co/rest/v1/news?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0NDE0OTMzOSwiZXhwIjoxOTU5NzI1MzM5fQ.X1ixX8JsfkhWh1-Lz1d9Cjgwr-A21Lw49Sm1NME59Ik',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0NDE0OTMzOSwiZXhwIjoxOTU5NzI1MzM5fQ.X1ixX8JsfkhWh1-Lz1d9Cjgwr-A21Lw49Sm1NME59Ik',
      },
      params: {},
      returnBody: true,
    );
  }
}

class FeerdNewsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Feerd News',
      apiUrl: 'https://feerd.directus.app/items/news',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
