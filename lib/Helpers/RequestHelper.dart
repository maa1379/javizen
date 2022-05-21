import 'dart:convert';
import 'package:http/http.dart' as http;

enum WebControllers {
  markets,
}
enum WebMethods {
  ticker,
}

class RequestHelper {
  static const String BaseUrl = 'https://javizen.com/api/v1';
  static const String ImageUrl = 'https://javizen.com/api/v1';

  static String imgUrl([String path = 'ProductGroups']) =>
      'https://new.negamarket.ir/admin/src/images/$path/';
  static const String ImageUrlForProducts =
      'https://new.negamarket.ir/admin/src/images/Products/';

  // static const String token = "";

  static Future<ApiResult> _makeRequestGet({
    WebControllers? webController,
    WebMethods? webMethod,
    Map<String, String> header = const {},
    Map body = const {},
  }) async {
    String url = RequestHelper._makePath(webController, webMethod);
    print(
        "Request url: $url\nRequest body: ${jsonEncode(body)}\n ${jsonEncode(header)}\n");
    http.Response response = await http.get(Uri.parse(url), headers: header);
    ApiResult apiResult = new ApiResult();
    apiResult.statusCode = response.statusCode;
    if (response.statusCode == 200) {
      try {
        print(response.body);
        Map data = jsonDecode(response.body);
        Map? data2 = jsonDecode(response.body);
        apiResult.data2 = data2;
        apiResult.isDone = data['isDone'] == true;
        apiResult.requestedMethod = data['requestedMethod'].toString();
        apiResult.data = data['data'];
      } catch (e) {
        apiResult.isDone = false;
        print(response.body);
        print(response.body);
        print(response.body);
        print(response.body);
        print(response.body);

        apiResult.requestedMethod = webMethod.toString().split('.').last;
        apiResult.data = response.body;
      }
    } else {
      apiResult.isDone = false;
    }
    print("\nRequest url: $url\nRequest body: ${jsonEncode(body)}\nResponse: {"
        "status: ${response.statusCode}\n"
        "isDone: ${apiResult.isDone}\n"
        "data: ${apiResult.data}"
        "}");
    return apiResult;
  }

  static Future<ApiResult> _makeRequestPost({
    WebControllers? webController,
    WebMethods? webMethod,
    Map<String, String> header = const {},
    Map body = const {},
  }) async {
    String url = RequestHelper._makePath(webController, webMethod);
    print(
        "Request url: $url\nRequest body: ${jsonEncode(body)}\n ${jsonEncode(header)}\n");
    http.Response response =
        await http.post(Uri.parse(url), headers: header, body: body);
    ApiResult apiResult = new ApiResult();
    apiResult.statusCode = response.statusCode;
    print(response.body);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400 ||
        response.statusCode == 201) {
      try {
        print(response.body);
        Map data = jsonDecode(response.body);
        apiResult.isDone = data['isDone'] == true;
        apiResult.requestedMethod = data['requestedMethod'].toString();
        apiResult.data = data['data'];
      } catch (e) {
        apiResult.isDone = false;
        print(response.body);
        print(response.body);
        print(response.body);
        print(response.body);
        print(response.body);

        apiResult.requestedMethod = webMethod.toString().split('.').last;
        apiResult.data = response.body;
      }
    } else {
      apiResult.isDone = false;
    }
    print("\nRequest url: $url\nRequest body: ${jsonEncode(body)}\nResponse: {"
        "status: ${response.statusCode}\n"
        "isDone: ${apiResult.isDone}\n"
        "data: ${apiResult.data}"
        "}");
    return apiResult;
  }

  static Future<ApiResult> _makeRequestPatch({
    WebControllers? webController,
    WebMethods? webMethod,
    Map<String, String> header = const {},
    Map body = const {},
  }) async {
    String url = RequestHelper._makePath(webController, webMethod);
    print(
        "Request url: $url\nRequest body: ${jsonEncode(body)}\n ${jsonEncode(header)}\n");
    http.Response response =
        await http.patch(Uri.parse(url), headers: header, body: body);
    ApiResult apiResult = new ApiResult();
    if (response.statusCode == 200) {
      try {
        print(response.body);
        Map data = jsonDecode(response.body);
        apiResult.isDone = data['isDone'] == true;
        apiResult.requestedMethod = data['requestedMethod'].toString();
        apiResult.data = data['data'];
      } catch (e) {
        apiResult.isDone = false;
        print(response.body);
        print(response.body);
        print(response.body);
        print(response.body);
        print(response.body);

        apiResult.requestedMethod = webMethod.toString().split('.').last;
        apiResult.data = response.body;
      }
    } else {
      apiResult.isDone = false;
    }
    print("\nRequest url: $url\nRequest body: ${jsonEncode(body)}\nResponse: {"
        "status: ${response.statusCode}\n"
        "isDone: ${apiResult.isDone}\n"
        "data: ${apiResult.data}"
        "}");
    return apiResult;
  }

  static String _makePath(WebControllers? webController, WebMethods? webMethod) {
    return "${RequestHelper.BaseUrl}/${webController.toString().split('.').last}/${'${webMethod.toString().split('.').last}'}";
  }


  // static Future<ApiResult> LoginOtp({String? mobile, String? code}) async {
  //   return await RequestHelper._makeRequestPost(
  //     webController: WebControllers.auth,
  //     webMethod: WebMethods.verify_code,
  //     body: {'phone_number': mobile, 'code': code},
  //   ).timeout(
  //     Duration(seconds: 50),
  //   );
  // }
  //
  static Future<ApiResult> getCoinList() async {
    return await RequestHelper._makeRequestGet(
        webController: WebControllers.markets,
        webMethod: WebMethods.ticker,
        ).timeout(
      Duration(seconds: 50),
    );
  }




//  **************************************************************************
//  **************************************************************************
//  **************************************************************************



  // static Future<ApiResult> registrationId({
  //   String? token,
  //   String? registration_id,
  // }) async {
  //   String url = "http://87.107.172.122/api/fcm/devices/";
  //   print(url);
  //   http.Response response = await http.post(Uri.parse(url), body: {
  //     "registration_id": registration_id,
  //     "type": "android",
  //   },headers: {
  //     'Accept': 'application/json',
  //     HttpHeaders.authorizationHeader: "Bearer ${token}"
  //   });
  //   ApiResult apiResult = new ApiResult();
  //   apiResult.statusCode = response.statusCode;
  //   if (response.statusCode == 200) {
  //     try {
  //       print(response.body);
  //       Map data = jsonDecode(response.body);
  //       apiResult.isDone = data['isDone'] == true;
  //       apiResult.requestedMethod = data['requestedMethod'].toString();
  //       apiResult.data = data['data'];
  //     } catch (e) {
  //       apiResult.isDone = false;
  //       print(response.body);
  //       print(response.body);
  //       print(response.body);
  //       print(response.body);
  //       print(response.body);
  //
  //       apiResult.requestedMethod = 'fcm';
  //       apiResult.data = response.body;
  //     }
  //   } else {
  //     apiResult.isDone = true;
  //   }
  //   print("\nRequest url: $url\nResponse: {"
  //       "status: ${response.statusCode}\n"
  //       "isDone: ${apiResult.isDone}\n"
  //       "data: ${apiResult.data}"
  //       "}");
  //   return apiResult;
  // }


}






class ApiResult {
  bool? isDone;
  String? requestedMethod;
  dynamic data;
  dynamic data2;
  var statusCode;

  ApiResult({
    this.isDone,
    this.requestedMethod,
    this.data,
    this.data2,
    this.statusCode,
  });
}
