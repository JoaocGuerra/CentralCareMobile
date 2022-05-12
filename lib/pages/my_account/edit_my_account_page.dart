import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../signIn/sign_in_page.dart';

class EditMyAccountPage extends StatelessWidget {
  EditMyAccountPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final dateController = TextEditingController();


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
                      const SizedBox(height: 70),
                      Text(
                        "Central Care",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.blueAccent[100],
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 70),
                      CustomTextFormField(
                        textEditingController: nameController,
                        isPasswordType: false,
                        icon: Icons.person,
                        text: 'Nome',
                        textInputType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nome Inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        textEditingController: emailController,
                        isPasswordType: false,
                        icon: Icons.email,
                        text: 'E-mail',
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email Inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        textEditingController: dateController,
                        isPasswordType: false,
                        icon: Icons.calendar_today,
                        text: 'Data de Nascimento',
                        textInputType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email Inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Salvar',
                      ),
                    ],
                  ),
                );
              })),
        ),
      ),
    );
  }
}
