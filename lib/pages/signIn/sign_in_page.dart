import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../forgotPassword/forgot_password_page.dart';
import '../home/home_page.dart';
import '../singUp/sign_up_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future singIn(BuildContext context) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage()));
    }catch(e){
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Email/Senha Incorreto."),
      );
      scaffoldKey.currentState?.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      "Central Care",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.blueAccent[100],
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
                      isPasswordType: true,
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
                          singIn(context);
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
                                    builder: (context) =>
                                        ForgotPasswordPage()));
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
