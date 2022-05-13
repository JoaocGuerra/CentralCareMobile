import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../signIn/sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim());
    adduserDetails(
      FirebaseAuth.instance.currentUser?.uid.trim(),
      nameController.text.trim(),
      lastNameController.text.trim(),
      numberController.text.trim(),
      emailController.text.trim()
    );
  }

  Future adduserDetails(String? id, String name, String lastName, String number, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'id' : id,
      'name': name,
      'lastName' : lastName,
      'number' : number,
      'birthday' : "-",
      'sex' : "-",
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fundo.jpg"), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
              child: Observer(builder: (_) {
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Central Care",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.blueAccent[100],
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        textEditingController: nameController,
                        isPasswordType: false,
                        icon: Icons.person,
                        text: 'Nome',
                        textInputType: TextInputType.name,
                        // onChanged: signInStore.setEmail,
                        // enabled: !signInStore.loading,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nome Inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        textEditingController: lastNameController,
                        isPasswordType: false,
                        icon: Icons.person,
                        text: 'Sobrenome',
                        textInputType: TextInputType.name,
                        // onChanged: signInStore.setEmail,
                        // enabled: !signInStore.loading,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Sobrenome Inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        textEditingController: numberController,
                        isPasswordType: false,
                        icon: Icons.phone_android,
                        text: 'Telefone',
                        textInputType: TextInputType.datetime,
                        // onChanged: signInStore.setEmail,
                        // enabled: !signInStore.loading,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Telefone Inválido";
                          }
                          return null;
                        },
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
                            return "Email Inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        textEditingController: passController,
                        isPasswordType: true,
                        icon: Icons.lock,
                        text: 'Senha',
                        textInputType: TextInputType.emailAddress,
                        // onChanged: signInStore.setPass,
                        // enabled: !signInStore.loading,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Senha Inválida";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            signUp();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          }
                        },
                        text: 'CADASTRAR',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                              text: 'Já tem conta?', corText: Colors.white70),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInPage()));
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
              })),
        ),
      ),
    );
  }
}
