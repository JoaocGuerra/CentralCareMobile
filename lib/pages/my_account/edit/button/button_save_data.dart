import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../store/edit_user/user_store.dart';

class ButtonSaveData extends StatelessWidget {
  final UserStore editUserStore = GetIt.I<UserStore>();

  ButtonSaveData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        editUserStore.updateUser();
        Navigator.of(context).pop();
      },
      text: 'Salvar',
    );
  }
}
