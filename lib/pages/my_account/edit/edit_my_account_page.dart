import 'package:brasil_fields/brasil_fields.dart';
import 'package:centralcaremobile/store/edit_user/user_store.dart';
import 'package:centralcaremobile/widgets/background_centra_care.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../common_widgets/custom_textformfield.dart';
import 'button/button_save_data.dart';

class EditMyAccountPage extends StatelessWidget {
  final UserStore userStore = GetIt.I<UserStore>();

  EditMyAccountPage({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundCentralCare(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
            child: Observer(builder: (_) {
              return WillPopScope(
                onWillPop: userStore.clearAllFields,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Editar Perfil",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blueAccent[100],
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      generateField(
                        0,
                        userStore.dataUser?.nome ?? "loading...",
                        userStore.nomeController,
                        Icons.person,
                        [],
                      ),
                      const SizedBox(height: 20),
                      generateField(
                        0,
                        userStore.dataUser?.sobrenome ?? "loading...",
                        userStore.sobrenomeController,
                        Icons.person_pin_rounded,
                        [],
                      ),
                      const SizedBox(height: 20),
                      generateField(
                        3,
                        userStore.dataUser?.cpf ?? "loading...",
                        userStore.cpfController,
                        Icons.numbers,
                        [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter()
                        ],
                      ),
                      const SizedBox(height: 20),
                      generateField(
                        0,
                        userStore.dataUser?.email ?? "loading...",
                        userStore.emailController,
                        Icons.email,
                        [],
                      ),
                      const SizedBox(height: 20),
                      generateField(
                        4,
                        "******",
                        userStore.senhaController,
                        Icons.lock,
                        [],
                      ),
                      const SizedBox(height: 20),
                      generateField(
                        2,
                        userStore.dataUser?.data_nascimento ?? "loading...",
                        userStore.nascimentoController,
                        Icons.calendar_today,
                        [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter()
                        ],
                      ),
                      const SizedBox(height: 20),
                      generateField(
                          1,
                          userStore.dataUser?.telefone ?? "loading...",
                          userStore.telefoneController,
                          Icons.phone_android, [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ]),
                      const SizedBox(height: 20),
                      ButtonSaveData()
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}

CustomTextFormField generateField(
    int tipo,
    String text,
    TextEditingController controller,
    IconData icon,
    List<TextInputFormatter> list) {
  if (tipo == 0) {
    return CustomTextFormField(
      textEditingController: controller,
      isPasswordType: false,
      icon: icon,
      text: text,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Campo Inválido";
        }
        return null;
      },
      list: list,
    );
  } else if (tipo == 1) {
    return CustomTextFormField(
      textEditingController: controller,
      isPasswordType: false,
      icon: icon,
      text: text,
      textInputType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 14) {
          return "Campo Inválido";
        }
        return null;
      },
      list: list,
    );
  } else if (tipo == 2) {
    return CustomTextFormField(
      textEditingController: controller,
      isPasswordType: false,
      icon: icon,
      text: text,
      textInputType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty || value.length != 10) {
          return "Data Inválida. Formtato: DD/MM/AAAA";
        } else {
          int _dia = int.parse(value[0] + value[1]);
          int _mes = int.parse(value[3] + value[4]);
          int _ano = int.parse(value[6] + value[7] + value[8] + value[9]);
          if (!((_dia.compareTo(0) == 1 && _dia.compareTo(32) == -1) &&
              (_mes.compareTo(0) == 1 && _mes.compareTo(13) == -1) &&
              (_ano.compareTo(DateTime.now().year) != 1 &&
                  _ano.compareTo(1900) != -1))) {
            return "Data Inválida";
          }
        }
        return null;
      },
      list: list,
    );
  } else if (tipo == 3) {
    return CustomTextFormField(
      textEditingController: controller,
      isPasswordType: false,
      icon: icon,
      text: text,
      textInputType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 11) {
          return "Campo Inválido";
        }
        return null;
      },
      list: list,
    );
  } else {
    return CustomTextFormField(
      textEditingController: controller,
      isPasswordType: true,
      icon: icon,
      text: text,
      textInputType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Senha Inválida";
        } else if (value.length < 6) {
          return "Minimo 6 caracteres";
        }
        return null;
      },
      list: const [],
    );
  }
}
