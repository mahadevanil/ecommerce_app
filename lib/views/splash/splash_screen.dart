import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/splash/splash_bloc.dart';
import '../../constants/route_constants.dart';
import '../../constants/string_constants.dart';
import '../../style/colors.dart';
import '../../style/text_styles.dart';
import '../../utils/enums.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state.loadingStatus == LoadingStatus.success) {
              context.go(
                RouteConstants.path.products,
              );
            }
          },
          //!-------------(rapidor )----------------
          child: Center(
            child: Animate(
                child: KStyles()
                    .semiBold(
                      text: StringConst.rapidor,
                      size: 40,
                    )
                    .animate()
                    .shader(duration: 3.seconds)
                    .fadeIn(duration: 300.ms)),
          )),
    );
  }
}
