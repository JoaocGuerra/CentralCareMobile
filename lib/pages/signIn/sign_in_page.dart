import 'package:centralcaremobile/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../singUp/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignInPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF1E90FF),
                  Color(0xFF00BFFF),
                  Color(0xFF6495ED),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child:Form(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                       "Central Care",
                     style: TextStyle(
                       fontSize: 40,
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                     ),
                   ),
                    const SizedBox(height: 100),
                    const CustomTextFormField(
                      isPasswordType: false,
                      icon: Icons.email,
                      text: 'E-mail',
                      textInputType: TextInputType.emailAddress,
                      // onChanged: signInStore.setEmail,
                      // enabled: !signInStore.loading,
                      // validator: (String? value) => signInStore.emailError,
                    ),
                    const SizedBox(height: 20),
                    const CustomTextFormField(
                      isPasswordType: false,
                      icon: Icons.lock,
                      text: 'Senha',
                      textInputType: TextInputType.emailAddress,
                      // onChanged: signInStore.setPass,
                      // enabled: !signInStore.loading,
                      // validator: (String? value) => signInStore.passError,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: (){},
                      text: 'ENTRAR',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const SignUpPage()));
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
                        const CustomText(text: 'Não tem conta?', corText: Colors.white70),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => const SignUpPage()));
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
              )
      ),
    );
  }
}
