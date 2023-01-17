import 'package:digital14_demo/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimmerEffectWidget extends StatelessWidget {
  const SimmerEffectWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighLight,
      enabled: true,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(15, (index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(
                      child: Container(
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: AppColors.shimmerBorder))),
                        width: 120,
                        height: 80,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      side: const BorderSide(color: AppColors.shimmerBorder))),
                              width: 300,
                              height: 24.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        side: const BorderSide(color: AppColors.shimmerBorder))),
                                width: 120,
                                height: 20.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        side: const BorderSide(color: AppColors.shimmerBorder))),
                                width: 200,
                                height: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
