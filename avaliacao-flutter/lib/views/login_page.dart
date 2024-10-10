import 'package:chat_app/components/auth_button.dart';
import 'package:chat_app/components/confirm_button.dart';
import 'package:chat_app/components/custom_input.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/views/home_page.dart';
import 'package:chat_app/views/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.message_outlined,
                size: 120,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              CustomInput(
                controller: emailController,
                labelText: 'Email',
              ),
              SizedBox(height: 10),
              CustomInput(
                controller: passwordController,
                labelText: 'Password',
                isObscure: true,
              ),
              SizedBox(height: 20),
              ConfirmButton(
                labelText: 'Entrar',
                onPressed: () async {
                  try {
                    var user = await FirebaseAuthService()
                        .login(emailController.text, passwordController.text);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          e.toString(),
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Ainda não tem uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: const Text('Inscreva-se'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthButton(
                    image:
                        'https://cdn-icons-png.flaticon.com/512/2702/2702602.png',
                  ),
                  SizedBox(width: 10), // Espaço entre os botões
                  AuthButton(
                    image:
                        'https://static.vecteezy.com/system/resources/previews/016/716/481/original/facebook-icon-free-png.png',
                  ),
                  SizedBox(width: 10), // Espaço entre os botões
                  AuthButton(
                    image:
                        'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
