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
  PharmacyItem({super.key, required this.index, required this.pharmacies});
  List<Pharmacy> pharmacies;
  final int index;

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.read<AppLayout>();
    return Consumer<PharmacyViewModel>(
      builder:
          (context, pharmacyViewModel, child) => GestureDetector(
            onTap: () async {
              pharmacyViewModel.selectPharmacy(pharmacy: pharmacies[index]);
              await pharmacyViewModel.fetchProductsByPharmacyId(
                pharmacyId: pharmacies[index].pharmacyId,
              );
              GoRouter.of(context).pushNamed(AppRouter.availableProductsView);
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Color(0xffeef4f4),
                border: Border.all(color: AppColors.lightPrimaryColor),
                borderRadius: BorderRadius.circular(layout.rlg * 2),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(layout.sm),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(pharmacies[index].image),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(layout.rlg * 2),
                      ),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              pharmacies[index].name,
                              style: AppTextStyle.lightBody(
                                layout,
                              ).copyWith(fontSize: layout.fontMedium),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              textDirection: TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${pharmacies[index].distance}km',
                                  style: AppTextStyle.lightSubtitle(layout),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(width: layout.sm),
                                Text(
                                  '${pharmacies[index].rating}',
                                  style: AppTextStyle.lightBody(
                                    layout,
                                  ).copyWith(
                                    color: Color(0xffff9900),
                                    fontSize: layout.fontMedium * 1.1,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                Transform.translate(
                                  offset: Offset(0, -0.5),
                                  child: Icon(
                                    size: layout.fontLarge,
                                    Icons.star_border_purple500_rounded,
                                    color: Color(0xffff9900),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              textDirection: TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  pharmacies[index].isOpen
                                      ? 'مفتوحة الان'
                                      : 'مغلقة الان',
                                  style: AppTextStyle.lightSubtitle(layout),
                                ),
                                SizedBox(width: layout.sm * 0.4),
                                Icon(
                                  size: layout.fontLarge,
                                  Icons.timer_outlined,
                                  color: AppColors.lightPrimaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
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
