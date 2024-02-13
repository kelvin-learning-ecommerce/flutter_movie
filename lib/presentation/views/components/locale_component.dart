import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/image_path.dart';
import '../../blocs/locale_bloc.dart';
import '../../events/locale_event.dart';
import '../../states/locale_state.dart';

class LocaleComponent extends StatelessWidget {
  const LocaleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(10),
      child: InkWell(
        key: const Key("changeLanguageButton"),
        onTap: () {
          localeBloc?.add(const LocaleChangeLangEvent());
        },
        child: BlocBuilder<LocaleBloc, LocaleState>(
          buildWhen: (prev, state) => state is LocaleStateLoading || state is LocaleStateChangeLocale,
          builder: (context, state) {
            if (state is LocaleStateChangeLocale) {
              if (state.locale?.countryCode == "en") {
                return Image.asset(
                  enIc,
                  width: 20.w,
                  height: 20.h,
                );
              }else {
                return Image.asset(
                  idIc,
                  width: 20.w,
                  height: 20.h,
                );
              }
            }

            return Container(
              key: const Key("Locale default widget"),
            );
          },
        ),
      ),
    );
  }
}
