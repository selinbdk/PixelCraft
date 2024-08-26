import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelcraft/config/gen/assets.gen.dart';
import 'package:pixelcraft/config/gen/colors.gen.dart';
import 'package:pixelcraft/core/collections/image_response_collection.dart';
import 'package:pixelcraft/core/components/buttons/app_button.dart';
import 'package:pixelcraft/core/components/buttons/app_icon_button.dart';
import 'package:pixelcraft/core/components/dialog/loading_dialog.dart';
import 'package:pixelcraft/core/components/image/primary_image.dart';
import 'package:pixelcraft/core/components/snackbar/snack_bar_extension.dart';
import 'package:pixelcraft/core/cubits/download_image/download_image_cubit.dart';
import 'package:pixelcraft/core/cubits/share_image/share_image_cubit.dart';
import 'package:pixelcraft/core/theme/app_theme.dart';
import 'package:pixelcraft/l10n/l10.dart';
import 'package:pixelcraft/view/widgets/permission_alert.dart';
import 'package:pixelcraft/view/widgets/prompt_text_field.dart';
import 'package:cached_memory_image/cached_memory_image.dart';

@RoutePage()
class ResultView extends StatelessWidget {
  const ResultView({
    required this.collection,
    super.key,
  });

  final ImageResponseCollection collection;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShareImageCubit, ShareImageState>(
      listener: (context, state) {
        if (state is ShareImageLoading) {
          showDialog(
            context: context,
            builder: (context) => const LoadingDialog(),
            barrierDismissible: false,
          );
        } else if (state is ShareImageFailure) {
          context
            ..maybePop()
            ..showErrorMessage(message: 'Something Went Wrong!');
        } else if (state is ShareImageSuccess) {
          context.maybePop();
        } else if (state is SharePermissionDenied) {
          showDialog(
            context: context,
            builder: (context) => const PermissionAlert(),
            barrierDismissible: false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: AppIconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: ColorName.secondaryLabel.withOpacity(0.60),
              size: 26.sp,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            AppLocalizations.of(context).resultTitle,
            style: context.appTextTheme.displayMedium?.copyWith(
              color: ColorName.primaryLabel,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp,
            ),
          ),
          actions: [
            AppIconButton(
              icon: Assets.icons.share.svg(),
              onPressed: () => context.read<ShareImageCubit>().shareImage(collection.base64),
            ),
          ],
        ),
        body: BlocListener<DownloadImageCubit, DownloadImageState>(
          listener: (context, state) {
            if (state is DownloadImageLoading) {
              showDialog(
                context: context,
                builder: (context) => const LoadingDialog(),
                barrierDismissible: false,
              );
            } else if (state is DownloadImageFailure) {
              context
                ..maybePop()
                ..showErrorMessage(message: 'Something Went Wrong!');
            } else if (state is DownloadImageSuccess) {
              context
                ..maybePop()
                ..showSuccessMessage(message: 'Image Successfully Downloaded!');
            }
          },
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: '${collection.id}',
                  child: Padding(
                    padding: AppPadding.pagePadding,
                    child:PrimaryImage.memory(
                      base64String: collection.base64,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.pagePadding,
                child: PromptTextField(
                  controller: TextEditingController(text: collection.prompt),
                  maxLines: 2,
                  minLines: 1,
                  readOnly: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: AppPadding.pagePadding,
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        onPressed: () {},
                        messages: AppLocalizations.of(context).regenerateButtonTitle,
                        backgroundColor: ColorName.secondaryBackground,
                        foregroundColor: ColorName.primaryBlue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppButton(
                        onPressed: () => context.read<DownloadImageCubit>().downloadImage(collection.base64),
                        messages: AppLocalizations.of(context).downloadButtonTitle,
                        backgroundColor: ColorName.primaryBlue,
                        foregroundColor: ColorName.primaryLabel,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
