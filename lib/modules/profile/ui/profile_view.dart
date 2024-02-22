import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/profile/bloc/profile_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/profile/events/profile_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/profile/states/profile_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/widgets/app_button.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/extensions/routes_ext.dart';

import '../../../generated/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    profileBloc?.add(const ProfileLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (prevState, currState) =>
          currState is ProfileStateLogoutSuccess || currState is ProfileStateLoadSuccess,
      listener: (context, state) {
        if (state is ProfileStateLogoutSuccess) {
          context.backToLogin();
        }
      },
      builder: (context, state) {
        if (state is ProfileStateLoadSuccess) {
          var data = state.user;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: REdgeInsets.all(12),
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(12.r))),
                child: Column(
                  children: [
                    Text("${S.of(context).username_label}: ${data.username}"),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text("${S.of(context).name_label}: ${data.name}"),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text("${S.of(context).phoneno_label}: ${data.name}"),
                    SizedBox(
                      height: 12.h,
                    ),
                    AppButton(
                        label: "Logout",
                        function: () {
                          profileBloc?.add(const ProfileLogoutAttemptEvent());
                        })
                  ],
                ),
              )
            ],
          );
        }

        return Container();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
