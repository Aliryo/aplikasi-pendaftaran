import 'package:aplikasi_pendaftaran_siswa/data/src/app_images.dart';
import 'package:aplikasi_pendaftaran_siswa/utils/double_extension.dart';
import 'package:aplikasi_pendaftaran_siswa/views/widgets/widget_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JadwalPendaftaranPage extends StatelessWidget {
  const JadwalPendaftaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentStep = 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jadwal Pendaftaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        children: [
          WidgetStepper(currentStep: currentStep),
          30.0.height,
          Text(
            currentStep == 0
                ? 'Pendaftaran Administrasi'
                : currentStep == 1
                    ? 'Daftar Ulang'
                    : 'Awal masuk ajaran baru',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          30.0.height,
          Image.asset(
            currentStep == 0
                ? AppImages.step1
                : currentStep == 1
                    ? AppImages.step2
                    : AppImages.step3,
          ),
          32.0.height,
          currentStep == 0
              ? const Text(
                  'Pendaftaran dilakukan secara online, dimulai tanggal 20 april 2023 sampai 05 juni 2023, dengan persyaratan administrasi sebagai berikut :'
                  '\n\n1. Calon peserta didik berusia 7 tahun minimal 6 tahun pada saat pendaftaran, dibuktikan dengan akta kelahiran.'
                  '\n\n2. Mengisi formulir pendaftaran sesuai jadwal pendaftaran.',
                )
              : currentStep == 1
                  ? const Text(
                      'Pendaftaran dilakukan secara online, dimulai tanggal 20 april 2023 sampai 05 juni 2023, dengan persyaratan administrasi sebagai berikut :'
                      '\n\n1. Calon peserta didik berusia 7 tahun, dibuktikan dengan akta kelahiran '
                      '\n\n2. Mengisi formulir pendaftaran sesuai jadwal pendaftaran,',
                    )
                  : const Text(
                      'Pendaftaran dilakukan secara online, dimulai tanggal 20 april 2023 sampai 05 juni 2023, dengan persyaratan administrasi sebagai berikut :'
                      '\n\n1. Calon peserta didik berusia 7 tahun, dibuktikan dengan akta kelahiran.'
                      '\n\n2. Mengisi formulir pendaftaran sesuai jadwal pendaftaran.',
                    ),
        ],
      ),
    );
  }
}