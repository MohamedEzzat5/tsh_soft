import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../injection_container.dart';

class CustomProfileImagePickerWidget extends StatefulWidget {
  final void Function(File?) onImageSelected;
  final String? initialImageUrl; // جديد: الصورة الافتراضية من الـ API

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

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      widget.onImageSelected(_pickedImage);
    }
  }

  void _showImageSourceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('اختر من المعرض'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('التقاط صورة بالكاميرا'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => _showImageSourceOptions(context),
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
                          widget.initialImageUrl!,
                          fit: BoxFit.cover,
                          width: 140.w,
                          height: 140.h,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.person,
                                size: 50.w, color: Colors.grey);
                          },
                        )
                      : Icon(Icons.person, size: 50.w, color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => _showImageSourceOptions(context),
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: context.colors.main,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                color: context.colors.textColor,
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
