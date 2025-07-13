import '../../../../../core/helper/extensions.dart';
import '../../../../../core/helper/images.dart';
import '../../../../../core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/commen/trounded_imagecontainer.dart';
import '../../../logic/cubit/authcubit.dart';

class ScoialMediaIcons extends StatelessWidget {
  const ScoialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedImageContainer(
          image: ImagesPath.googleLogo,
          onTap: () async {
            context.read<AuthCubit>().googleSignIn(context);
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is GoogleSignInSuccess) {
                  context.pushReplacementNamed(Routes.navigationBarMenu);
                }
              },
            );
          },
        ),
        SizedBox(width: 20.w),
        RoundedImageContainer(image: ImagesPath.facebookLogo),
        SizedBox(width: 20.w),
        RoundedImageContainer(image: ImagesPath.appleLogo),
      ],
    );
  }
}
