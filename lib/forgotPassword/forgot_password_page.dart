import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textformfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
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
                    const Text(
                      "Insira o email para solicitar mudança de senha",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (kDebugMode) {
                            print("Enviando Solicitação de redefinição de senha!");
                          }
                        }
                      },
                      text: 'Enviar',
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
