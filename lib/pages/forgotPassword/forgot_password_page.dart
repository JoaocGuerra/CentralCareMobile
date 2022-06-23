import 'package:centralcaremobile/helpers/validators.dart';
import 'package:centralcaremobile/pages/signIn/sign_in_page.dart';
import 'package:centralcaremobile/widgets/background_centra_care.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../../constants/constants_api.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future changePassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
    } catch (e) {
      const snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text("Email não cadastrado."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundCentralCare(
      body: SingleChildScrollView(
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
                  list: const [],
                  textEditingController: emailController,
                  isPasswordType: false,
                  icon: Icons.email,
                  text: 'E-mail',
                  textInputType: TextInputType.emailAddress,
                  // onChanged: signInStore.setEmail,
                  // enabled: !signInStore.loading,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !emailValid(value)) {
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
                      changePassword(context);
                    }
                  },
                  text: 'Solicitar alteração de senha',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
