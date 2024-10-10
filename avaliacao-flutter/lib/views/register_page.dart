import 'package:chat_app/components/auth_button.dart';
import 'package:chat_app/components/confirm_button.dart';
import 'package:chat_app/components/custom_input.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/show_message.dart';
import 'package:chat_app/views/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.app_registration,
                size: 120,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              const Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomInput(
                controller: nameController,
                labelText: 'Nome',
              ),
              const SizedBox(height: 10),
              CustomInput(
                controller: emailController,
                labelText: 'Email',
              ),
              const SizedBox(height: 10),
              CustomInput(
                controller: phoneController,
                labelText: 'Telefone',
              ),
              const SizedBox(height: 10),
              CustomInput(
                controller: passwordController,
                labelText: 'Senha',
                isObscure: true,
              ),
              const SizedBox(height: 10),
              CustomInput(
                controller: confirmController,
                labelText: 'Repita sua Senha',
                isObscure: true,
              ),
              const SizedBox(height: 20),
              ConfirmButton(
                onPressed: () async {
                  try {
                    await FirebaseAuthService().register(
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                      passwordController.text,
                    );

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  } catch (e) {
                    showMessage(context, e);
                  }
                },
                labelText: 'Cadastrar',
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: const Text('Já tem uma conta? Faça login!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
