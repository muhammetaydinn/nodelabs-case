import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_scaffold.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_button.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_image_widgets.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/core/design_system/theme/shartflix_padding.dart';
import 'package:shartflix/core/design_system/theme/shartflix_text_styles.dart';
import 'package:shartflix/core/design_system/theme/shartflix_sizes.dart';
import 'package:shartflix/core/services/gallery_service.dart';
import 'package:shartflix/core/network/dependy_injection/injection.dart';
import 'package:shartflix/features/profile/presentation/blocs/upload_profile_image_bloc/upload_profile_image_bloc.dart';
import 'package:shartflix/features/profile/presentation/blocs/upload_profile_image_bloc/upload_profile_image_event.dart';
import 'package:shartflix/features/profile/presentation/blocs/upload_profile_image_bloc/upload_profile_image_state.dart';
import 'package:shartflix/features/profile/domain/usecases/upload_profile_image_use_case.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_profile_bloc/get_profile_bloc.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_profile_bloc/get_profile_event.dart';
import 'package:shartflix/generated/assets.gen.dart';

import '../../../home/presentation/pages/home_page.dart';

class UpdateProfileImagePage extends StatefulWidget {
  static const String name = '/UpdateProfileImagePage';
  static const String path = '/UpdateProfileImagePage';

  // Register'dan gelecek olan için farklı route
  static const String nameFromRegister = '/UpdateProfileImageFromRegister';
  static const String pathFromRegister = '/UpdateProfileImageFromRegister';

  final bool isComingFromProfile;

  const UpdateProfileImagePage({super.key, this.isComingFromProfile = false});

  @override
  State<UpdateProfileImagePage> createState() => _UpdateProfileImagePageState();
}

class _UpdateProfileImagePageState extends State<UpdateProfileImagePage> {
  File? selectedImage;
  bool isPickingImage = false;
  late final UploadProfileImageBloc _uploadBloc;

  @override
  void initState() {
    super.initState();
    _uploadBloc = getIt<UploadProfileImageBloc>();
  }

  Future<void> _pickImage() async {
    setState(() {
      isPickingImage = true;
    });

    try {
      final File? image = await GalleryService.showImagePicker(context);

      if (image != null) {
        setState(() {
          selectedImage = image;
        });
      }
    } catch (e) {
      // Error handling is now done inside GalleryService
    } finally {
      setState(() {
        isPickingImage = false;
      });
    }
  }

  void _handleUpload() {
    if (selectedImage != null) {
      final uploadRequest = UploadProfileImageRequest(
        imageFile: selectedImage!,
      );
      _uploadBloc.add(
        UploadProfileImageRequested(uploadRequest: uploadRequest),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShartflixScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80.w,
        leading: Center(
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              padding: ShartflixPadding.p8.all,
              decoration: BoxDecoration(
                color: ShartflixColors.white10,
                shape: BoxShape.circle,
                border: Border.all(color: ShartflixColors.white20),
              ),
              child: Icon(
                Icons.arrow_back,
                color: ShartflixColors.white,
                size: ShartflixSizes.size20,
              ),
            ),
          ),
        ),
        title: Text(
          context.tr('profile.title'),
          style: ShartflixTextStyles.labelMedium.copyWith(
            color: ShartflixColors.white,
            fontSize: ShartflixSizes.size14,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<UploadProfileImageBloc, UploadProfileImageState>(
        bloc: _uploadBloc, // Use the stored instance
        listener: (context, state) {
          switch (state) {
            case UploadProfileImageSuccess():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.tr('profile.photoUpdatedSuccess')),
                ),
              );

              if (widget.isComingFromProfile) {
                try {
                  final profileBloc = getIt<GetProfileBloc>();
                  profileBloc.add(const GetProfileRequested());
                } catch (e) {
                  print(e);
                }
                context.pop();
              } else {
                context.go(HomePage.path);
              }
              break;
            case UploadProfileImageFailure():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    context.tr(
                      'profile.photoUpdateError',
                      args: [state.errorMessage],
                    ),
                  ),
                ),
              );
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          final isUploading = state is UploadProfileImageLoading;
          final isLoading = isPickingImage || isUploading;

          return Column(
            children: [
              SizedBox(height: ShartflixSizes.size20),
              Text(
                context.tr('profile.uploadTitle'),
                style: ShartflixTextStyles.movieTitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ShartflixSizes.size8),
              Text(
                context.tr('profile.uploadSubtitle'),
                style: ShartflixTextStyles.movieDescription.copyWith(
                  color: ShartflixColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ShartflixSizes.size48),
              GestureDetector(
                onTap: isLoading ? null : _pickImage,
                child: Container(
                  width: 1.sw * 0.5,
                  height: 1.sw * 0.5,
                  decoration: BoxDecoration(
                    color: ShartflixColors.white10,
                    borderRadius: BorderRadius.circular(ShartflixSizes.size32),
                    border: Border.all(
                      color: selectedImage != null
                          ? ShartflixColors.brandRed
                          : ShartflixColors.white10,
                      width: 2,
                    ),
                  ),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ShartflixColors.brandRed,
                          ),
                        )
                      : selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(
                            ShartflixSizes.size30,
                          ),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        )
                      : Center(
                          child: ShartflixSvgImage(
                            assetPath: Assets.icons.svgIcons.plus,
                            width: ShartflixSizes.size40,
                            height: ShartflixSizes.size40,
                            color: ShartflixColors.white50,
                          ),
                        ),
                ),
              ),
              if (selectedImage != null) ...[
                SizedBox(height: ShartflixSizes.size16),
                TextButton(
                  onPressed: isLoading ? null : _pickImage,
                  child: Text(
                    context.tr('profile.changePhoto'),
                    style: ShartflixTextStyles.textButtonText.copyWith(
                      color: isLoading ? ShartflixColors.white50 : Colors.green,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              Padding(
                padding:
                    ShartflixPadding.p26.horizontal +
                    ShartflixPadding.p36.vertical,
                child: ShartflixButton(
                  title: isUploading
                      ? context.tr('profile.uploading')
                      : widget.isComingFromProfile
                      ? context.tr('profile.update')
                      : context.tr('profile.continue'),
                  textStyle: ShartflixTextStyles.labelMedium.copyWith(
                    fontSize: ShartflixSizes.size14,
                  ),
                  onPressed: selectedImage != null && !isLoading
                      ? _handleUpload
                      : null,
                  height: ShartflixSizes.size52,
                  borderRadius: ShartflixSizes.size18,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // Don't dispose the bloc since it's managed by GetIt
    super.dispose();
  }
}
