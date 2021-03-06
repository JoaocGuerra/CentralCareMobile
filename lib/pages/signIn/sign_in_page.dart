import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../../store/auth/auth_store.dart';
import '../../widgets/background_centra_care.dart';
import '../forgotPassword/forgot_password_page.dart';
import '../home/home_page.dart';
import '../singUp/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  late bool _passwordVisible = false;
  final AuthStore authStore = GetIt.I<AuthStore>();

  Future singIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
      authStore.fetchUser();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Email/Senha Incorreto."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundCentralCare(
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        "Central Care",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.blueAccent[100],
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 80),
                      CustomTextFormField(
                        textEditingController: emailController,
                        isPasswordType: false,
                        icon: Icons.email,
                        text: 'E-mail',
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email Incorreto";
                          }
                          return null;
                        },
                        list: const [],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Senha incorreta";
                          }
                          return null;
                        },
                        controller: passController,
                        obscureText: !_passwordVisible,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(
                              icon:Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off
                              ),
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                            filled: true,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            fillColor: Colors.blueAccent.withOpacity(0.3),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
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
                              text: 'N??o tem conta?', corText: Colors.white70),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUpPage()));
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
                  ))),
        ));
  }
}
