import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/navigation/app_routes.dart';
import 'package:nova_demo/profile_picture/profile_picture_controller.dart';

class ProfilePictureView extends StatelessWidget {
  ProfilePictureView({super.key});

  final ProfilePictureController profilePictureController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CommonLogics.setPngImage('back_arrow',
                        height: 24, width: 24),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRoutes.dashboard);
                      },
                      child: CommonLogics.commonText(
                        'Skip',
                        fontSize: 16.0,
                        color: AppColor.customWhite,
                        fontFamily: AppFonts.medium,
                      )),
                ],
              ),
              const SizedBox(height: 34),
              CommonLogics.commonText(
                'Upload profile picture',
                fontFamily: AppFonts.bold,
                fontSize: 26.0,
              ),
              const SizedBox(height: 35),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // CircleAvatar with black border
                    GestureDetector(
                      onTap: () {
                        profilePictureController.getImage(ImageSource.gallery);
                      },
                      child: Container(
                        width: 114,
                        // The width of the container (double the radius of the outer CircleAvatar)
                        height: 114,
                        // The height of the container (double the radius of the outer CircleAvatar)
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Ensure it's a circle
                          border: Border.all(
                              color: Colors.white,
                              width:
                                  1), // White border around the red CircleAvatar
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 54,
                            backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                            // your image URL
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),

                    const Positioned(
                      bottom: 0,
                      right: 35,
                      child: CircleAvatar(
                        radius: 12, // size of the edit icon
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.edit,
                          size: 15,
                          color: Colors.white,
                        ),
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
