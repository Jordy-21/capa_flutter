import 'package:modernlogintute/Utils/internet.dart';
 
class LoginService {
  
  Future login({required Map<String,dynamic>body }) async {
    String url = "https://recursoshumanos.shalom.com.pe/api/user_logued_app";   
    dynamic response = await Internet.httpPost(
      url: url,
      body: body,
      seconds: 10,
    );
    return response;
  }

}