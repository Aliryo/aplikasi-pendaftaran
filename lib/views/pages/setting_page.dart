import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../data/src/app_images.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    Widget cardSetting({
      required Widget icon,
      required String title,
    }) {
      return Row(
        children: [
          icon,
          8.0.width,
          Expanded(
            child: Text(title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18.w,
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 36.h,
            height: 36.h,
            margin: EdgeInsets.only(left: 8.w),
            padding: EdgeInsets.all(6.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.green.withOpacity(0.15)),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 24.h,
                color: Colors.green,
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              16.0.height,
              Row(
                children: [
                  Image.asset(
                    AppImages.avatar,
                    width: 80.h,
                  ),
                  16.0.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authController.user.value.name ?? '',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      4.0.height,
                      Text(
                        authController.user.value.email ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      4.0.height,
                      Text(
                        (authController.user.value.role ?? '').capitalize ??
                            "",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: authController.user.value.role == 'member'
                                ? Colors.green
                                : Colors.amber),
                      ),
                    ],
                  ),
                ],
              ),
              16.0.height,
              const Divider(
                thickness: 1,
                color: Colors.green,
              ),
              24.0.height,
              cardSetting(
                  icon: const Icon(Icons.health_and_safety_rounded),
                  title: "Ubah Password"),
              16.0.height,
              cardSetting(
                  icon: const Icon(Icons.health_and_safety_rounded),
                  title: "Ubah Password"),
              16.0.height,
              cardSetting(
                  icon: const Icon(Icons.handshake),
                  title: "Ubah Password"),
              16.0.height,
              cardSetting(
                  icon: const Icon(Icons.health_and_safety_rounded),
                  title: "Ubah Password"),
              16.0.height,
              cardSetting(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.green,
                  ),
                  title: "Keluar"),
              16.0.height,
            ],
          ),
        );
      }),
    );
  }
}
