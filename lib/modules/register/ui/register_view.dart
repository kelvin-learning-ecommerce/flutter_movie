import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/bloc/login_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/login/events/login_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/register/bloc/register_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/widgets/custom_text_field.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/widgets/app_bar.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/register_error_enum.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/extensions/routes_ext.dart';

import '../../../generated/l10n.dart';
import '../../../utils/snakebar/snakebar_util.dart';
import '../../widgets/app_button.dart';
import '../events/register_event.dart';
import '../states/register_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        title: S.of(context).login_title,
      ),
      body: const RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  String? usernameError;
  String? passwordError;
  String? nameError;
  String? phoneNoError;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (prevState, currState) => currState is RegisterStateSuccess || currState is RegisterStateError,
      listener: (context, state) {
        if (state is RegisterStateSuccess) {
          showSnackBar(context, S.of(context).register_success_label);
        } else if (state is RegisterStateError) {
          setState(() {
            if (state.error == RegisterError.nameError) {
              nameError = "${S.of(context).name_label} ${S.of(context).empty_label}";
            } else if (state.error == RegisterError.phoneNoError) {
              phoneNoError = "${S.of(context).phoneno_label} ${S.of(context).empty_label}";
            } else if (state.error == RegisterError.usernameError) {
              usernameError = "${S.of(context).username_label} ${S.of(context).empty_label}";
            } else if (state.error == RegisterError.passwordError) {
              passwordError = "${S.of(context).password_label} ${S.of(context).empty_label}";
            }
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        key: const Key(""),
        children: [
          CustomTextField(
            controller: nameController,
            labelText: S.of(context).name_label,
            errorMessage: nameError,
          ),
          CustomTextField(
            controller: phonenoController,
            labelText: S.of(context).phoneno_label,
            errorMessage: phoneNoError,
            textInputType: TextInputType.phone,
          ),
          CustomTextField(
            controller: usernameController,
            labelText: S.of(context).username_label,
            errorMessage: usernameError,
          ),
          CustomTextField(
            controller: passwordController,
            labelText: S.of(context).password_label,
            isPassword: true,
            errorMessage: passwordError,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppButton(
            label: S.of(context).register_label,
            function: () {
              setState(() {
                usernameError = null;
                passwordError = null;
                nameError = null;
                phoneNoError = null;
              });

              registerBloc?.add(RegisterAttemptEvent(
                usernameController.text,
                passwordController.text,
                nameController.text,
                phonenoController.text,
              ));
            },
          ),
        ],
      ),
    );
  }
}
