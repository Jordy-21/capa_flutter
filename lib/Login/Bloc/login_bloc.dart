
import 'package:modernlogintute/Login/Services/login_service.dart';

class LoginBloc {

  //External Vars
  LoginService service = LoginService();

  Future requestLogin({required String user, required String password})async{
    dynamic response = await service.login(body: {
      "usr": user,
      "pwd":password,
    });
    if(response["message"] == "Invalid login credentials"){
      print("Usted ingreso credenciales incorrectas");
      return;
    }
    if(response["message"] =="Incomplete login details"){
      print("credenciales incompletas");
      return;
    }
    print("Se logeo exitosamente");
  }

}