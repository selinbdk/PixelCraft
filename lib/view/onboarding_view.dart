import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelcraft/core/components/app_button.dart';
import 'package:pixelcraft/gen/assets.gen.dart';
import 'package:pixelcraft/l10n/l10.dart';
import 'package:pixelcraft/theme/app_theme.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: <Widget>[
          Image.asset(Assets.images.onboardingImage.keyName),

          //* General huge container
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: AppPadding.pagePadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //* Messages container
                    Text(
                      AppLocalizations.of(context).onboardingTitleMessage,
                      textAlign: TextAlign.center,
                      style: context.appTextTheme.displayMedium?.copyWith(
                        color: AppColors.primaryLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.sp,
                      ),
                    ),

                    //* Space between messages
                    16.vSpace,

                    //* Secondary message
                    Text(
                      AppLocalizations.of(context).onboardingContentMessage,
                      textAlign: TextAlign.center,
                      style: context.appTextTheme.bodyMedium?.copyWith(
                        color: AppColors.secondaryLabel,
                        fontSize: 15.sp,
                      ),
                    ),

                    //* Space between message container and button
                    74.vSpace,

                    //* Button
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: AppButton(
                        messages: context.l10n.letsGoButtonTitle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
