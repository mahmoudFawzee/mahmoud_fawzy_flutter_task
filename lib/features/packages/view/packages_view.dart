import 'package:flutter/material.dart';
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
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const PackageCard(),
            ),

            ContactUsCard(appLocalizations: appLocalizations),
          ],
        ),
      ),
    );
  }
}
