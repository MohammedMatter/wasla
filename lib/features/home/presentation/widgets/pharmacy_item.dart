import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/features/pharmacies/domain/entities/pharmacy.dart';
import 'package:wasla/features/pharmacies/presentation/view_models/pharmacy_view_model.dart';

class PharmacyItem extends StatelessWidget {
  const PharmacyItem({
    super.key,
    required this.index,
    required this.pharmacies,
  });

  final List<Pharmacy> pharmacies;
  final int index;

  @override
  Widget build(BuildContext context) {
    final layout = AppLayout();
    final pharmacy = pharmacies[index];

    return Consumer<PharmacyViewModel>(
      builder:
          (context, pharmacyViewModel, child) => GestureDetector(
            onTap: () async {
              pharmacyViewModel.selectPharmacy(pharmacy: pharmacy);
              await pharmacyViewModel.fetchProductsByPharmacyId(
                pharmacyId: pharmacy.pharmacyId,
              );
              if (context.mounted) {
                GoRouter.of(context).pushNamed(AppRouter.availableProductsView);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: layout.sm.clamp(4.0, 8.0),
                horizontal: layout.xs,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color(0xffeef4f4),
                border: Border.all(
                  color: AppColors.lightPrimaryColor.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.circular(layout.rlg * 1.5),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.all(layout.xs),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(pharmacy.image),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: layout.xs),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            pharmacy.name,
                            style: AppTextStyle.lightBody(layout).copyWith(
                              fontSize: layout.fontSmall.clamp(14.0, 18.0),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${pharmacy.distance}km',
                                  style: AppTextStyle.lightSubtitle(layout),
                                ),
                                SizedBox(width: layout.sm),
                                Text(
                                  '${pharmacy.rating}',
                                  style: AppTextStyle.lightBody(
                                    layout,
                                  ).copyWith(color: const Color(0xffff9900)),
                                ),
                                const Icon(
                                  Icons.star_rounded,
                                  color: Color(0xffff9900),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  pharmacy.isOpen
                                      ? 'مفتوحة الآن'
                                      : 'مغلقة الآن',
                                  style: AppTextStyle.lightSubtitle(
                                    layout,
                                  ).copyWith(
                                    color:
                                        pharmacy.isOpen
                                            ? Colors.green.shade700
                                            : Colors.red.shade700,
                                    fontSize: (layout.fontSmall * 0.9).clamp(
                                      10.0,
                                      13.0,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: layout.xs),
                                Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.lightPrimaryColor,
                                  size: layout.fontMedium.clamp(16.0, 20.0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: layout.xs),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
