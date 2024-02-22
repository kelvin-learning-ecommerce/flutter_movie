import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/bloc/login_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/events/login_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/states/login_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/widgets/custom_text_field.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/widgets/app_bar.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/login_error_enum.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/extensions/routes_ext.dart';

import '../../../generated/l10n.dart';
import '../../widgets/app_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        title: S.of(context).login_title,
      ),
      body: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (prevState, currState) => currState is LoginStateSuccess || currState is LoginStateError,
      listener: (context, state) {
        if (state is LoginStateSuccess) {
          context.goToHome();
        } else if (state is LoginStateError) {
          setState(() {
            errorMessage = state.error == LoginError.userNotFound
                ? S.of(context).user_not_found_error
                : S.of(context).check_login_data_error;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        key: const Key(""),
        children: [
          CustomTextField(
            controller: usernameController,
            labelText: S.of(context).username_label,
            errorMessage: errorMessage,
          ),
          CustomTextField(
            controller: passwordController,
            labelText: S.of(context).password_label,
            isPassword: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppButton(
            label: S.of(context).login_title,
            function: () {
              setState(() {
                errorMessage = null;
              });

              loginBloc?.add(LoginAttemptEvent(usernameController.text, passwordController.text));
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          AppButton(
            label: S.of(context).register_label,
            function: () {},
          )
        ],
      ),
    );
  }
}
