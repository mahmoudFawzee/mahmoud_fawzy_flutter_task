import 'package:flutter/material.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/check_box/custom_check_box.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';
import 'package:mahmoudfawzy_flutter_task/l10n/app_localizations.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});
  static const pageRoute = '/packages-screen';
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.chooseYourPackages)),
      body: Column(
        children: [
          Text(appLocalizations.chooseFromBelowPackages),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.only(bottom: 16),

              child: Stack(
                clipBehavior: Clip.none,

                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: context.greyBorder,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomCheckBox(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                Text(
                                  'اكسترا',
                                  style: context.textStyles.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: context.deepBlue,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '3000ج.م',
                              style: context.textStyles.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.deepOrange,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        const SizedBox(height: 8),

                        Row(
                          children: [
                            Column(
                              children: [
                                ...List.generate(5, (index) {
                                  return Text('feature $index');
                                }),
                                Positioned(
                                  top: 8,
                                  right: -32,
                                  child: Transform.rotate(
                                    angle: 0.785398, // 45 degrees
                                    child: Container(
                                      width: 100,
                                      color: context.lightOrang,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'banner text content',
                                        style: context.textStyles.displaySmall!
                                            .copyWith(
                                              color: context.lightOrang,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //if features is not empty
                            Text('data'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(color: context.greyBorder),
              color: context.offWhit,
            ),
            child: Column(
              children: [
                Text(appLocalizations.specialPackages),
                Text(appLocalizations.contactUs),
                TextButton(
                  onPressed: () {},
                  child: Text(appLocalizations.sellingTeam),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
