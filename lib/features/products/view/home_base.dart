import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mahmoudfawzy_flutter_task/config/routes/navigation_cubit.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/view/packages_view.dart';
import '/config/theme/app_theme.dart';
import '/l10n/app_localizations.dart';

import '../../../config/resources/image_manger.dart';

class HomeBase extends StatelessWidget {
  const HomeBase({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final navigationCubit = context.read<NavigationCubit>();
    return SafeArea(
      child: Scaffold(
        body: child,
        bottomNavigationBar: Container(
          height: 62,
          decoration: BoxDecoration(
            color: context.white,
            border: Border(
              top: BorderSide(color: context.greyBorder, width: 1.5),
            ),
          ),

          child: BlocBuilder<NavigationCubit, int>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavBarItem(
                    svgImageIcon: ImageManger.homeIcon,
                    label: appLocalizations.home,
                    isSelected: state == 0,
                    onTap: () => navigationCubit.navigateTo(0),
                  ),
                  BottomNavBarItem(
                    svgImageIcon: ImageManger.chatIcon,
                    label: appLocalizations.chat,
                    isSelected: state == 1,

                    onTap: () => navigationCubit.navigateTo(1),
                  ),
                  BottomNavBarItem(
                    svgImageIcon: ImageManger.addBoxIcon,
                    isAddTap: true,
                    label: appLocalizations.addAdvertisement,
                    onTap: () {
                      log('add advertisement');
                    },
                  ),
                  BottomNavBarItem(
                    svgImageIcon: ImageManger.dataSetIcon,
                    isSelected: state == 3,

                    label: appLocalizations.myAdvertisements,
                    onTap: () => navigationCubit.navigateTo(3),
                  ),
                  BottomNavBarItem(
                    svgImageIcon: ImageManger.accountIcon,
                    isSelected: state == 4,

                    label: appLocalizations.myAccount,
                    onTap: () {
                      context.push(PackagesScreen.pageRoute);
                      navigationCubit.navigateTo(4);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.svgImageIcon,
    required this.label,
    this.isSelected = false,
    this.isAddTap = false,
    required this.onTap,
  });
  final String svgImageIcon;
  final String label;
  final bool isSelected;
  final bool isAddTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: context.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(svgImageIcon),
            Text(
              label,
              style: context.textStyles.labelSmall!.copyWith(
                color: isAddTap
                    ? context.deepBlue
                    : isSelected
                    ? context.black
                    : context.fontGrey,
                fontWeight: !isSelected ? FontWeight.w400 : FontWeight.w500,
              ),
            ),
            if (isSelected)
              Container(
                width: 70,
                height: 5,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 2, left: .3, right: .3),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(55),
                ),
                child: Container(
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
