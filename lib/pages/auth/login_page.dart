import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:groupchat/pages/auth/register_page.dart';
import 'package:groupchat/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo1.jpg",
                      height: 80,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "¡Inicia sesión ahora para ver de qué están hablando!"),
                    Image.asset(
                      "assets/login1.jpg",
                      height: 200,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                          labelText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColor,
                          )),
                      validator: (value) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!)
                            ? null
                            : "Introduzca un email valido";
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                          print(email);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Theme.of(context).primaryColor,
                          )),
                      validator: (value) {
                        if (value!.length < 6) {
                          return "El password debe tener 6 caracteres";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                          print(password);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                          login();
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text.rich(TextSpan(
                        text: "¿No tienes usuario? ",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Registro aqui",
                              style: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextScreen(context, const RegisterPage());
                                }),
                        ]))
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  login() {
    if (formKey.currentState!.validate()) {}
  }
}
