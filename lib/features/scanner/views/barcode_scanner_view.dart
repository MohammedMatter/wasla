import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/utils/screen_size.dart';
import 'package:wasla/core/widgets/custom_elevated_button_widget.dart';

class BarcodeScannerView extends StatefulWidget {
  const BarcodeScannerView({super.key});

  @override
  State<BarcodeScannerView> createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<BarcodeScannerView> {
  final MobileScannerController controller = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: ScreenSize.h(context) / 2,
            width: double.infinity,
            child: Image.asset(
              'assets/images/medicines/medicine_barcode.png',
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(layout.md),
              disabledBackgroundColor: Colors.white,
              backgroundColor: AppColors.lightPrimaryColor,

              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.lightPrimaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(layout.rlg),
              ),
            ),
            child: Text(
              'مسح الباركورد',
              style: AppTextStyle.lightBody(layout).copyWith(
                fontSize: layout.fontMedium * 1.40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      // Stack(
      //   children: [
      //     // 1. شاشة الكاميرا الحقيقية
      //     MobileScanner(
      //       controller: controller,
      //       onDetect: (capture) {
      //         final List<Barcode> barcodes = capture.barcodes;
      //         for (final barcode in barcodes) {
      //           debugPrint('تم العثور على باركود: ${barcode.rawValue}');

      //           // هون المنطق تبعك:
      //           // 1. خذ الرقم (barcode.rawValue)
      //           // 2. ابحث عنه في الـ ViewModel
      //           // 3. انتقل لصفحة المنتج
      //           _handleBarcode(barcode.rawValue);
      //         }
      //       },
      //     ),

      //     // 2. التصميم (المربع اللي بالصورة تبعتك)
      //     _buildOverlay(context),
      //   ],
      // ),
    );
  }

  void _handleBarcode(String? code) {
    if (code != null) {
      // توقف الكاميرا مؤقتاً عشان ما يكرر المسح
      controller.stop();

      // مثال: الانتقال لصفحة المنتج
      // context.pushNamed(AppRouter.productDetails, extra: code);
    }
  }

  Widget _buildOverlay(BuildContext context) {
    return Container(
      // هون بتصمم المربع الشفاف والزرار مثل الصورة اللي بعتتها
      // استخدم Color.withOpacity(0.5) للخلفية
    );
  }
}
