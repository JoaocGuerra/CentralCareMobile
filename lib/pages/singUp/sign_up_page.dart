import 'package:brasil_fields/brasil_fields.dart';
import 'package:centralcaremobile/helpers/validators.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_textformfield.dart';
import '../signIn/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPage createState() => _SignUpPage();
}

enum Menu { MASCULINO, FEMININO, OUTRO }

class _SignUpPage extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final birthDayController = TextEditingController();
  var _gender = "Gênero";
  Color _genderColor = Colors.white.withOpacity(0.9);
  bool _stepOne = true;
  bool _stepTwo = false;
  bool _stepThree = false;
  bool _ready = false;
  var _buttonLabel = "CONTINUAR";

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim());
    adduserDetails(
        FirebaseAuth.instance.currentUser?.uid.trim(),
        nameController.text.trim(),
        lastNameController.text.trim(),
        numberController.text.trim(),
        birthDayController.text.trim(),
        _gender.trim(),
        emailController.text.trim());
  }

  Future adduserDetails(String? id, String name, String lastName, String number,
      String birthDay, String gender, String email) async {
    var photo = "";
    if(gender == "MASCULINO") {
      photo = "http://cdn-icons-png.flaticon.com/512/1373/1373255.png";
    } else if (gender == "FEMININO") {
      photo = "https://cdn.icon-icons.com/icons2/1999/PNG/512/avatar_people_person_profile_user_woman_icon_123359.png";
    } else {
      photo = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Person_icon_%28the_Noun_Project_2817719%29.svg/1200px-Person_icon_%28the_Noun_Project_2817719%29.svg.png";
    }
    await FirebaseFirestore.instance.collection('pacientes').doc(id).set({
      'id': id,
      'name': name,
      'lastName': lastName,
      'number': number,
      'birthday': birthDay,
      'sex': gender,
      'email': email,
      'photo' : photo
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
                      const SizedBox(height: 60),
                      Text(
                        "Central Care",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.blueAccent[100],
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 80),
                      Visibility(
                        visible: _stepOne,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              list: const [],
                              textEditingController: emailController,
                              isPasswordType: false,
                              icon: Icons.email,
                              text: 'E-mail',
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (!emailValid(value!)) {
                                  return "Email Inválido";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _stepOne,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              textEditingController: passController,
                              isPasswordType: true,
                              icon: Icons.lock,
                              text: 'Senha',
                              textInputType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Senha Inválida";
                                } else if (value.length < 8) {
                                  return "Minimo 8 caracteres";
                                }
                                return null;
                              },
                              list: const [],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _stepTwo,
                        child: Column(
                          children: [
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
                              list: const [],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _stepTwo,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              textEditingController: lastNameController,
                              isPasswordType: false,
                              icon: Icons.person,
                              text: 'Sobrenome',
                              textInputType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Sobrenome Inválido";
                                }
                                return null;
                              },
                              list: const [],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _stepTwo,
                        child: Column(
                          children: [
                            Column(children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(90)),
                                height: 55,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            _gender,
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: _genderColor),
                                          ),
                                        ],
                                      ),
                                      PopupMenuButton<Menu>(
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                            size: 30,
                                          ),

                                          onSelected: (Menu item) {
                                            setState(() {
                                              _gender = item.name;
                                            });
                                          },
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry<Menu>>[
                                                const PopupMenuItem<Menu>(
                                                  value: Menu.MASCULINO,
                                                  child: Text('MASCULINO'),
                                                ),
                                                const PopupMenuItem<Menu>(
                                                  value: Menu.FEMININO,
                                                  child: Text('FEMININO'),
                                                ),
                                                const PopupMenuItem<Menu>(
                                                  value: Menu.OUTRO,
                                                  child: Text('OUTRO'),
                                                ),
                                              ])
                                    ]),
                              ),
                            ]),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _stepThree,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              textEditingController: numberController,
                              isPasswordType: false,
                              icon: Icons.phone_android,
                              text: 'Telefone',
                              textInputType: TextInputType.phone,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 14) {
                                  return "Número Inválido";
                                }
                                return null;
                              },
                              list: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()
                              ],
                            ),
                            const SizedBox(height: 10)
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _stepThree,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              textEditingController: birthDayController,
                              isPasswordType: false,
                              icon: Icons.calendar_today,
                              text: 'Data de Nascimento',
                              textInputType: TextInputType.datetime,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length != 10) {
                                  return "Data Inválida. Formtato: DD/MM/AAAA";
                                } else {
                                  int _dia = int.parse(value[0] + value[1]);
                                  int _mes = int.parse(value[3] + value[4]);
                                  int _ano = int.parse(value[6] +
                                      value[7] +
                                      value[8] +
                                      value[9]);
                                  if (!((_dia.compareTo(0) == 1 &&
                                          _dia.compareTo(32) == -1) &&
                                      (_mes.compareTo(0) == 1 &&
                                          _mes.compareTo(13) == -1) &&
                                      (_ano.compareTo(DateTime.now().year) !=
                                              1 &&
                                          _ano.compareTo(1900) != -1))) {
                                    return "Data Inválida.";
                                  }
                                }
                                return null;
                              },
                              list: [
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter()
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          if (_ready) {
                            if (formKey.currentState!.validate()) {
                              signUp();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInPage()));
                            }
                          } else if (_stepOne) {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                _stepOne = false;
                                _stepTwo = true;
                                _stepThree = false;
                              });
                            }
                          } else if (_stepTwo) {
                            if (!(_gender.compareTo("Gênero") == 0)) {
                              setState(() {
                                _genderColor = Colors.white.withOpacity(0.9);
                              });
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  _stepOne = false;
                                  _stepTwo = false;
                                  _stepThree = true;
                                });
                              }
                            } else {
                              setState(() {
                                _genderColor = Colors.red;
                              });
                            }
                          } else if (_stepThree) {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                _stepOne = true;
                                _stepTwo = true;
                                _stepThree = true;
                                _ready = true;
                                _buttonLabel = "CADASTRAR";
                              });
                            }
                          }
                        },
                        text: _buttonLabel,
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
