import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:easy_localization/easy_localization.dart';

import '../design_system/theme/shartflix_colors.dart';
import '../design_system/theme/shartflix_text_styles.dart';
import '../design_system/theme/shartflix_padding.dart';
import '../design_system/theme/shartflix_sizes.dart';
import '../design_system/custom_widgets/gallery_option_tile.dart';

class GalleryService {
  static const int maxFileSize = 4 * 1024 * 1024;
  static const int compressQuality = 80;

  static Future<File?> pickImage(BuildContext context, bool fromCamera) async {
    try {
      File? imageFile;

      if (fromCamera) {
        final picker = ImagePicker();
        final XFile? pickedFile = await picker.pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.rear,
          imageQuality: 85,
          maxWidth: 1080,
          maxHeight: 1080,
        );

        if (pickedFile == null) return null;
        imageFile = File(pickedFile.path);
      } else {
        final result = await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: false,
        );

        if (result == null || result.files.isEmpty) return null;
        imageFile = File(result.files.first.path!);
      }

      // Fotoğrafı compress et
      final dir = await getTemporaryDirectory();
      final targetPath = '${dir.path}/${const Uuid().v4()}.jpg';

      final compressedResult = await FlutterImageCompress.compressAndGetFile(
        imageFile.path,
        targetPath,
        quality: compressQuality,
        minWidth: 512,
        minHeight: 512,
        format: CompressFormat.jpeg,
      );

      if (compressedResult == null) return null;
      final compressedFile = File(compressedResult.path);

      if (compressedFile.lengthSync() > maxFileSize) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'errors.fileTooLarge'.tr(),
                style: ShartflixTextStyles.bodyMedium,
              ),
              backgroundColor: ShartflixColors.brandRed,
            ),
          );
        }
        return null;
      }

      return compressedFile;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'errors.generalError'.tr(args: [e.toString()]),
              style: ShartflixTextStyles.bodyMedium,
            ),
            backgroundColor: ShartflixColors.brandRed,
          ),
        );
      }
      return null;
    }
  }

  static Future<File?> showImagePicker(BuildContext context) async {
    try {
      final bool? fromCamera = await showModalBottomSheet<bool>(
        context: context,
        backgroundColor: ShartflixColors.darkBackground,
        isScrollControlled: true,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(ShartflixSizes.size20),
          ),
        ),
        builder: (BuildContext ctx) {
          return Padding(
            padding: ShartflixPadding.p20.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: ShartflixPadding.p16.onlyBottom,
                  child: Text(
                    'profile.selectPhoto'.tr(),
                    style: ShartflixTextStyles.titleLarge,
                  ),
                ),
                GalleryOptionTile(
                  icon: Icons.photo_library,
                  title: 'profile.chooseFromGallery'.tr(),
                  onTap: () => Navigator.pop(ctx, false),
                ),
                Divider(
                  indent: ShartflixSizes.size20,
                  endIndent: ShartflixSizes.size20,
                  color: ShartflixColors.greyBorder,
                ),
                GalleryOptionTile(
                  icon: Icons.camera_alt,
                  title: 'profile.takePhoto'.tr(),
                  onTap: () => Navigator.pop(ctx, true),
                ),
              ],
            ),
          );
        },
      );

      if (fromCamera == null) return null;

      if (context.mounted) {
        return await pickImage(context, fromCamera);
      }
      return null;
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'errors.generalError'.tr(args: [e.toString()]),
              style: ShartflixTextStyles.bodyMedium,
            ),
            backgroundColor: ShartflixColors.brandRed,
          ),
        );
      }
      return null;
    }
  }
}
