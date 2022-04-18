import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../signIn/sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
              child: Observer(builder: (_){
                return Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      const Text(
                        "Central Care",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 70),
                      const CustomTextFormField(
                        isPasswordType: false,
                        icon: Icons.person,
                        text: 'Nome',
                        textInputType: TextInputType.name,
                        // onChanged: signInStore.setEmail,
                        // enabled: !signInStore.loading,
                        // validator: (String? value) => signInStore.emailError,
                      ),
                      const SizedBox(height: 20),
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
                        onPressed: (){
                          // if (signInStore.formKeyValid) {
                          //   signInStore.signIn(_onSuccess, _onFail);
                          // }
                        },
                        text: 'CADASTRAR',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(text: 'Já tem conta?', corText: Colors.white70),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                   MaterialPageRoute(builder: (context) => SignInPage()));
                            },
                            child: const CustomText(
                              text: ' Faça Login',
                              corText: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              })
          ),
        ),
      ),
    );
  }
}
