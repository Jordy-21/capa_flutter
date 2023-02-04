import 'package:flutter/material.dart';
import 'package:modernlogintute/Login/Bloc/login_bloc.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  //External vars
  LoginBloc bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    // COMANDO PARA HACER RESPONSIVO EL FORMULARIO
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          width: size.width * 1,
          height: double.infinity,
          color: Color.fromARGB(255, 233, 108, 6),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.01),
                  // logo
                  const Icon(
                    Icons.account_circle_rounded,
                    size: 50,
                  ),

                  SizedBox(height: size.height * 0.01),

                  // welcome back, you've been missed!
                  const Center(
                    child: Text(
                      '¡Bienvenido de nuevo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 253, 253, 253),
                        fontSize: 25,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.01),

                  // username textfield
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Nombre de usuario',
                    obscureText: false,
                  ),

                  SizedBox(height: size.height * 0.01),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),

                  SizedBox(height: size.height * 0.01),

                  SizedBox(height: size.height * 0.01),

                  // sign in button
                  // MyButton(
                  //   onTap: signUserIn,
                  // ),
                  buttonLoging(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  imputLogings({required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelStyle: TextStyle(
          color: Color.fromARGB(255, 50, 219, 50),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );
  }

  buttonLoging() {
    return ElevatedButton(
      onPressed: () {
        // Respond to button press
        bloc.requestLogin(
            user: usernameController.text, password: passwordController.text);
      },
      child: Text('Iniciar Sesion'),
    );
  }
}
