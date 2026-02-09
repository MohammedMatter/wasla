import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wasla/core/constants/app_assest.dart';
import 'package:wasla/core/layout/app_layout.dart';
import 'package:wasla/core/router/app_router.dart';
import 'package:wasla/core/theme/app_color.dart';
import 'package:wasla/core/theme/app_text_style.dart';
import 'package:wasla/core/theme/design_tokens.dart';
import 'package:wasla/core/utils/screen_size.dart';

class FavoriteProductsView extends StatelessWidget {
  const FavoriteProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.read<AppLayout>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('المفضلة', style: AppTextStyle.lightHeading1(layout)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.lightPrimaryColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(
                      right: layout.md,
                      left: layout.md,
                      bottom: layout.sm,
                    ),
                    child: InkWell(
                      splashColor: AppColors.lightPrimaryColor.withOpacity(0.4),
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).goNamed(AppRouter.productDetailView);
                      },
                      child: Ink(
                        height: ScreenSize.h(context) * 0.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(layout.rmd),
                          border: Border.all(
                            color: AppColors.lightPrimaryColor,
                            width: 1.2,
                          ),
                          color: Color(0xffeef4f4),
                        ),

                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset(AppAssest.medicine),
                            Expanded(
                              child: Column(
                                textDirection: TextDirection.rtl,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'بانادول أكتيفاست ',
                                    style: AppTextStyle.lightBody(
                                      layout,
                                    ).copyWith(
                                      fontSize: layout.fontMedium * 1.35,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Text(
                                    'ج.م30 ',
                                    style: AppTextStyle.lightSubtitle(
                                      layout,
                                    ).copyWith(
                                      color: AppColors.lightPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: layout.md),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: layout.sm * 0.3,
                                              horizontal: layout.sm * 0.7,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    layout.rmd,
                                                  ),
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.heartCircleMinus,
                                              color: Color(0xffC33129),
                                              size: layout.fontLarge,
                                            ),
                                          ),
                                          SizedBox(width: layout.md),
                                          Icon(
                                            Icons.shopping_cart_outlined,
                                            color: AppColors.lightPrimaryColor,
                                            size: AppFontSize.fontLarge,
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
                  ),
              itemCount: 15,
            ),
          ),
          Container(color: AppColors.lightBackgroundColor, height: layout.xl),
        ],
      ),
    );
  }
}
