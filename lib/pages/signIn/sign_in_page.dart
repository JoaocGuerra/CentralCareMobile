import 'package:centralcaremobile/forgotPassword/forgot_password_page.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../singUp/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF1E90FF),
            Color(0xFF00BFFF),
            Color(0xFF6495ED),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      "Central Care",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 100),
                    CustomTextFormField(
                      textEditingController: emailController,
                      isPasswordType: false,
                      icon: Icons.email,
                      text: 'E-mail',
                      textInputType: TextInputType.emailAddress,
                      // onChanged: signInStore.setEmail,
                      // enabled: !signInStore.loading,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email Incorreto";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      textEditingController: passController,
                      isPasswordType: false,
                      icon: Icons.lock,
                      text: 'Senha',
                      textInputType: TextInputType.text,
                      // onChanged: signInStore.setPass,
                      // enabled: !signInStore.loading,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Senha incorreta";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Tudo certo. Entrando!");
                        }
                      },
                      text: 'ENTRAR',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage()));
                          },
                          child: const CustomText(
                            text: 'Esqueci minha senha',
                            corText: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                            text: 'Não tem conta?', corText: Colors.white70),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: const CustomText(
                            text: ' Cadastre-se',
                            corText: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
