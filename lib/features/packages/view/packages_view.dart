import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mahmoudfawzy_flutter_task/config/shared/loading/loading/home_shimmer_loading.dart';
import 'package:mahmoudfawzy_flutter_task/config/theme/app_theme.dart';
import 'package:mahmoudfawzy_flutter_task/features/packages/cubit/get_packages_cubit.dart';
import 'package:mahmoudfawzy_flutter_task/l10n/app_localizations.dart';
import 'widgets/contact_us_card.dart';
import 'widgets/package_card.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});
  static const pageRoute = '/packages-screen';
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(appLocalizations.chooseYourPackages),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appLocalizations.chooseFromBelowPackages),
            BlocBuilder<GetPackagesCubit, GetPackagesState>(
              builder: (context, state) {
                log('packages state: ${state.state}');
                if (state.state == GetPackagesStateEnum.loading) {
                  return ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, _) => const LoadingContainer(
                      height: 246,
                      width: double.infinity,
                      vMargin: 10,
                      radius: 8,
                    ),
                  );
                }
                if (state.state == GetPackagesStateEnum.success) {
                  final packages = state.packages;

                  return ListView.builder(
                    itemCount: packages!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final package = packages[index];
                      return PackageCard(package: package);
                    },
                  );
                }
                return const SizedBox();
              },
            ),
            ContactUsCard(appLocalizations: appLocalizations),

            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton.icon(
        
        iconAlignment: IconAlignment.end,
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward, size: 24),
        label: Text(
          appLocalizations.next,
          style: context.textStyles.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: context.white,
          ),
        ),
      ),
    );
  }
}
