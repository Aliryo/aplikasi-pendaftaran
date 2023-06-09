import 'package:aplikasi_pendaftaran_siswa/controller/auth_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/controller/jadwal_controller.dart';
import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/contact_us_alert.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/daftar_calon_siswa/daftar_calon_siswa_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/jadwal_pendaftaran/jadwal_pendaftaran_admin_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/jadwal_pendaftaran/jadwal_pendaftaran_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/pendaftaran/pendaftaran_siswa_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/profil_sekolah_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/setting/setting_page.dart';
import 'package:aplikasi_pendaftaran_siswa/views/pages/waktu_pendaftaran_alert.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_card_home.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_news_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthController authController = Get.find();
  final JadwalController jadwalController = Get.put(JadwalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        automaticallyImplyLeading: false,
        title: Obx(() {
          return Row(
            children: [
              Image.asset(
                AppImages.avatar,
                width: 60.h,
              ),
              16.0.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${authController.user.value.name ?? ''}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.0.height,
                  Text(
                    'Selamat datang di SDIP Baitussalam Kuningan',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          const Text(
            'Daftar Menu',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          16.0.height,
          FutureBuilder(
            future: authController.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data as QuerySnapshot;
              var role = (data.docs[0]['role']);
              if (snapshot.hasData) {
                if (role == 'member') {
                  return Center(
                    child: Wrap(
                      runSpacing: 16.h,
                      spacing: 8.w,
                      children: [
                        WidgetCardHome(
                          width: 112.w,
                          onTap: () {
                            DateTime.now().isBefore(jadwalController
                                        .jadwals.first.beginAt!) ||
                                    DateTime.now().isAfter(
                                        jadwalController.jadwals.first.endAt!)
                                ? showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const WaktuPendaftaranAlert())
                                : Get.to(() => PendaftaranSiswaBaruPage());
                          },
                          image: AppImages.register,
                          title: 'Pendaftaran\nSiswa baru',
                        ),
                        WidgetCardHome(
                          width: 112.w,
                          onTap: () {
                            Get.to(() => const DaftarCalonSiswaPage());
                          },
                          image: AppImages.student,
                          title: 'Lihat\nPendaftaran',
                        ),
                        WidgetCardHome(
                          width: 112.w,
                          onTap: () {
                            Get.to(() => JadwalPendaftaranPage());
                          },
                          image: AppImages.schedule,
                          title: 'Jadwal\nPendaftaran',
                        ),
                        WidgetCardHome(
                          width: 112.w,
                          onTap: () {
                            Get.to(() => const ProfilSekolahPage());
                          },
                          image: AppImages.school,
                          title: 'Profil Sekolah',
                        ),
                        WidgetCardHome(
                          width: 112.w,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => const ContactUsAlert());
                          },
                          image: AppImages.contactUs,
                          title: 'Hubungi Kami',
                        ),
                        WidgetCardHome(
                          width: 112.w,
                          onTap: () {
                            Get.to(() => SettingPage());
                          },
                          image: AppImages.setting,
                          title: 'Pengaturan',
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Wrap(
                      runSpacing: 20.h,
                      spacing: 12.w,
                      children: [
                        WidgetCardHome(
                          width: 150.w,
                          onTap: () {
                            Get.to(() => const DaftarCalonSiswaPage());
                          },
                          image: AppImages.student,
                          title: 'Daftar\nCalon Siswa',
                        ),
                        WidgetCardHome(
                          width: 150.w,
                          onTap: () {
                            Get.to(() => JadwalPendaftaranAdminPage());
                          },
                          image: AppImages.schedule,
                          title: 'Jadwal\nPendaftaran',
                        ),
                        WidgetCardHome(
                          width: 150.w,
                          onTap: () {
                            Get.to(() => const ProfilSekolahPage());
                          },
                          image: AppImages.school,
                          title: 'Profil Sekolah',
                        ),
                        WidgetCardHome(
                          width: 150.w,
                          onTap: () {
                            Get.to(() => SettingPage());
                          },
                          image: AppImages.setting,
                          title: 'Pengaturan',
                        ),
                      ],
                    ),
                  );
                }
              } else {
                return const SizedBox();
              }
            },
          ),
          16.0.height,
          const Text(
            'Kegiatan Sekolah',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          16.0.height,
          CarouselSlider(
            items: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    AppImages.kegiatan1,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    AppImages.kegiatan2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 180.h,
              viewportFraction: 1,
              autoPlay: true,
              initialPage: 0,
              onPageChanged: (index, reason) {},
            ),
          ),
          16.0.height,
          const Text(
            'Berita Sekolah',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          16.0.height,
          const WidgetNewsList(
            image: AppImages.berita1,
            title: 'Tasmi',
            subtitle:
                'Tasmi Juz 29 & 30 SDIP Baitussalam Tahun Pelajaran 2022/2023.',
            date: 'Jumat, 28 April 2023',
          ),
          const WidgetNewsList(
            image: AppImages.berita2,
            title: 'Mabit',
            subtitle: 'Mabit (Malam Bina Iman dan Taqwa) SDIP Baitussalam.',
            date: 'Kamis, 5 Januari 2023',
          ),
        ],
      ),
    );
  }
}
