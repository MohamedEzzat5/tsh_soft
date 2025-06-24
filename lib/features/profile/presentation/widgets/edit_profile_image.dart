import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../injection_container.dart';

class CustomProfileImagePickerWidget extends StatefulWidget {
  final void Function(File?) onImageSelected;
  final String? initialImageUrl;

  const CustomProfileImagePickerWidget({
    super.key,
    required this.onImageSelected,
    this.initialImageUrl,
  });

  @override
  State<CustomProfileImagePickerWidget> createState() =>
      _CustomProfileImagePickerWidgetState();
}

class _CustomProfileImagePickerWidgetState
    extends State<CustomProfileImagePickerWidget> {
  File? _pickedImage;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();

    try {
      // اطلب إذن الصور (اختياري لكن أفضل لبعض الأجهزة)
      var status = await Permission.photos.status;
      if (!status.isGranted) {
        status = await Permission.photos.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('يرجى السماح للوصول للصور')),
          );
          return;
        }
      }

      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 25,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile.path);
        });
        widget.onImageSelected(_pickedImage);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('حدث خطأ أثناء اختيار الصورة')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _pickImageFromGallery,
          child: CircleAvatar(
            radius: 70.r,
            backgroundColor: Colors.grey.shade300,
            child: ClipOval(
              child: _pickedImage != null
                  ? Image.file(
                      _pickedImage!,
                      fit: BoxFit.cover,
                      width: 140.w,
                      height: 140.h,
                    )
                  : widget.initialImageUrl != null
                      ? Image.network(
                          "https://store.tsh-dev.com/storage/${widget.initialImageUrl!}",
                          fit: BoxFit.cover,
                          width: 140.w,
                          height: 140.h,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              size: 50.w,
                              color: Colors.grey,
                            );
                          },
                        )
                      : Icon(
                          Icons.person,
                          size: 50.w,
                          color: Colors.grey,
                        ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: _pickImageFromGallery,
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: context.colors.main,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                color: context.colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        if (_pickedImage != null)
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _pickedImage = null;
                  widget.onImageSelected(null);
                });
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
