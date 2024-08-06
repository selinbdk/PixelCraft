part of '../../view/discover_view.dart';

class _SlidingPanel extends StatelessWidget {
  const _SlidingPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height /2,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 3 / 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900.withOpacity(0.4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            AppLocalizations.of(context).promptTitle,
                            style: context.appTextTheme.displayMedium?.copyWith(
                              color: ColorName.primaryLabel,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                        115.horizontalSpace,
                        AppIconButton(
                          icon: Assets.icons.close.svg(),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5,
                          sigmaY: 5,
                        ),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                          decoration: BoxDecoration(
                            color: ColorName.primaryBackground.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const PromptField(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: SizedBox(
                        height: 64,
                        child: AppButton(
                          onPressed: () {},
                          backgroundColor: ColorName.primaryBlue,
                          foregroundColor: ColorName.primaryLabel,
                          messages: context.l10n.generateButtonTitle,
                          icon: Assets.icons.wand.svg(),
                        ),
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





//  return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height*3/5,
//         color: ColorName.primaryBackground,
//         child: Stack(
//           children: [
//             BackdropFilter(
//               filter: ImageFilter.blur(
//                 sigmaX: 4,
//                 sigmaY: 4,
//               ),
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.white.withOpacity(0.15),
//                       Colors.white.withOpacity(0.05),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Center(
//                       child: Text(
//                         AppLocalizations.of(context).promptTitle,
//                         style: context.appTextTheme.displayMedium?.copyWith(
//                           color: ColorName.primaryLabel,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.sp,
//                         ),
//                       ),
//                     ),
//                     115.horizontalSpace,
//                     AppIconButton(
//                       icon: Assets.icons.close.svg(),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: AppPadding.pagePadding,
//                   child: const TextBoxWidget(),
//                 ),
//                 Padding(
//                   padding: AppPadding.pagePadding,
//                   child: AppButton(
//                     onPressed: () {},
//                     backgroundColor: ColorName.primaryBlue,
//                     foregroundColor: ColorName.primaryLabel,
//                     messages: context.l10n.generateButtonTitle,
//                     icon: Assets.icons.wand.svg(),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }