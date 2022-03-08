import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

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
